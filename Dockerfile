FROM golang:1.17-alpine as builder

WORKDIR /app

COPY go.* .
RUN go mod download

COPY . .

RUN go build -v -o hello

FROM scratch

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT ["./hello"]