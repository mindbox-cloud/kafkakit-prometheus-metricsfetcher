FROM golang:1.13.15-alpine3.12 AS build
WORKDIR /app
# COPY go.mod go.sum .
# ^^ add go.sum when you will need modules
COPY go.mod .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o ./out/app .

FROM gcr.io/distroless/static-debian10
COPY --from=build /app/out/app /usr/local/bin/app
ENTRYPOINT ["/usr/local/bin/app"]
