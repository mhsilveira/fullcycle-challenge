FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build fullcycle.go

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

CMD ["/fullcycle"]