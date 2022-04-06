FROM golang:1.14.0-alpine AS builder
RUN mkdir /build
ADD go.mod hello.go /build/
WORKDIR /build
RUN go build

FROM alpine
COPY --from=builder /build/codeeducation /app/
WORKDIR /app
CMD ["./codeeducation"]