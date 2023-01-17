FROM andyrbell/mountebank:latest
ARG GIT_TOKEN

LABEL maintainer="Ashok Kumar Pant <ashok.pant@miferia.com>"
LABEL version="1.0"
LABEL description="Mountebank Miferia"

WORKDIR /app
RUN apk add git

RUN npm install -g @ozonru/mountebank-grpc

RUN git clone https://${GIT_TOKEN}@github.com/getmiferia/proto.miferia.git
RUN git clone https://${GIT_TOKEN}@github.com/getmiferia/proto.core-payment.git
RUN git clone https://${GIT_TOKEN}@github.com/getmiferia/proto.payment-facilitator.git
RUN git clone https://${GIT_TOKEN}@github.com/getmiferia/proto.spei-facilitator.git
RUN git clone https://${GIT_TOKEN}@github.com/getmiferia/proto.openpay.git
RUN git clone https://${GIT_TOKEN}@github.com/getmiferia/proto.card.git

RUN echo '{"grpc": {"createCommand": "mb-grpc"}}' > protocols.json
EXPOSE 2525

ENTRYPOINT ["mb"]

CMD ["start",  "--protofile", "/app/protocols.json", "--allowInjection", "true", "--loglevel", "debug", "--cors", "--ipWhitelist", "*"]