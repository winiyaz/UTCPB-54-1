FROM golang:1.23.1-alpine

# Install necessary packages
RUN apk add --no-cache \
    chromium \
    git \
    build-base \
    libpcap-dev

# Set environment variables
ENV GO111MODULE=on
ENV CHROME_BIN=/usr/bin/chromium-browser

# Install tools
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
RUN go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go install github.com/projectdiscovery/katana/cmd/katana@latest
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
RUN go install github.com/sensepost/gowitness@latest

# Create a non-root user
RUN adduser -D appuser
WORKDIR /app
RUN chown -R appuser:appuser /app

# Copy configuration files
COPY ./subfinder_config.yaml /home/appuser/.config/subfinder/subfinder_config.yaml

# Ensure nuclei templates are updated and appuser has permissions
RUN mkdir -p /home/appuser/.config/nuclei && \
    chown -R appuser:appuser /home/appuser/.config && \
    nuclei -update-templates

# Switch to non-root user
USER appuser

# Expose volume for results
VOLUME /app/results

# Entry point for recon
ENTRYPOINT ["sh", "-c", "\
    subfinder -d $TARGET -o /app/results/subdomains.txt; \
    naabu -list /app/results/subdomains.txt -o /app/results/ports.txt; \
    dnsx -l /app/results/subdomains.txt -o /app/results/resolved.txt; \
    httpx -l /app/results/resolved.txt -o /app/results/httpx_output.txt; \
    katana -list /app/results/resolved.txt -jc -o /app/results/urls.txt; \
    nuclei -l /app/results/httpx_output.txt -o /app/results/nuclei_output.txt; \
    gowitness scan file -f /app/results/httpx_output.txt --chrome-path /usr/bin/chromium-browser --no-http2 --timeout 30;"]