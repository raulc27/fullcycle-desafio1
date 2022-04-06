FROM golang:1.14.0-alpine AS builder
RUN mkdir /build
ADD go.mod hello.go /build/
WORKDIR /build
RUN go build

FROM alpine
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/hello /app/
WORKDIR /app
CMD ["./hello"]