FROM node:20-alpine
RUN apk add --no-cache tini
ENV NODE_ENV=production
RUN npm install -g @modelcontextprotocol/server-everything@latest
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/sh", "-c", "exec npx -y @modelcontextprotocol/server-everything@latest sse --host 0.0.0.0 --port ${PORT:-3000}"]
