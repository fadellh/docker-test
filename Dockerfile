FROM node:14.18.1-alpine

RUN addgroup app && adduser -S -G app app
USER app
#make directory
WORKDIR /app
#Copy All directory to alpine environtment with make app folder
##COPY . /app/##

#copy all source directory to workdir directory which is /app
COPY . .

#Kita skrg udh ada di app directory. Ketika run dengan sh
# docker run -it react-app sh
#hasil diatas akan membawa kita app dir di alpine linux

#Sekarang kita coba run npm install. RUN pada docker untuk membuat linux command
RUN npm install
#Jika kita run -it (interactive) dengan sh (shell) maka ketika ls-1 akan muncul node module

ENV API_URL=http://api.myapp.com
#printenv untuk liat env atau echo $API_URL

EXPOSE 5000

#RUN Command buiding instrtuction
#CMD commad 
CMD ["npm", "start"]

#Pasti di execute kalo CMD bisa di overwrite
#ENTRYPOINT [ "npm","start" ]#


