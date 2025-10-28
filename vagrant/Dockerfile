FROM node:latest AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci 

COPY . .

ENV NEXT_PUBLIC_FIREBASE_API_KEY=AIzaSyAV5Ks_JDxWDraTiuoGKE2Q8mxqYLpMdMw \
    NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=e-commerce-user-44d36.firebaseapp.com \
    NEXT_PUBLIC_FIREBASE_PROJECT_ID=e-commerce-user-44d36 \
    NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=e-commerce-user-44d36.appspot.com \
    NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=919168588790 \
    NEXT_PUBLIC_FIREBASE_APP_ID=1:919168588790:web:e5bbda8c4fd9e9a9a645d7 \
    NODE_ENV=production \
    NEXT_PUBLIC_DOMAIN=http://192.168.56.16:3000

RUN npm run build

FROM node:latest


ENV MONGO_URL="" \
    TOKEN_SECRET="" \
    PRODUCT_PER_PAGE=2 \
    RAZORPAY_KEY="" \
    RAZORPAY_SECRET="" \
    EMAIL="" \
    PASSWORD="" \
    ACCOUNT_SID="" \
    AUTH_TOKEN="" \


WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public


EXPOSE 3000

CMD ["npm" , "run" , "start"]

