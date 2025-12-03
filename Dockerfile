FROM --platform=$BUILDPLATFORM ghcr.io/cirruslabs/flutter:stable AS builder
WORKDIR /app
COPY chatbot_frontend/pubspec.* ./
RUN flutter pub get
COPY chatbot_frontend/ .
RUN flutter build web --release
FROM nginx:alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
