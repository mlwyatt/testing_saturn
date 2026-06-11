FROM ruby:3.4-slim AS builder

RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/saturnci/saturnci-sdk.git /tmp/saturnci-sdk \
  && cd /tmp/saturnci-sdk \
  && gem build saturnci-sdk.gemspec

FROM ruby:3.4-slim
COPY --from=builder /tmp/saturnci-sdk/saturnci-sdk-*.gem /tmp/
RUN gem install /tmp/saturnci-sdk-*.gem && rm /tmp/saturnci-sdk-*.gem

ENTRYPOINT ["ruby", "-rsaturnci-sdk"]
