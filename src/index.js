const express = require('express');
const morgan = require('morgan');
const {engine} = require('express-handlebars');
const path = require('path');


//inicializacion 
const app = express();


//setting//configuraciones --- en que puerto va a funcionar el servidor 
app.set('port', process.env.PORT || 4000); //si existe un puerto que se use de lo contrario se toma el 4000
app.set('views', path.join(__dirname, 'views')); //le digo al programa donde esta la carpeta views
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),  //join junta directorios //concatenado con layouts
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs', //esta funcion esta en la carpeta lib en handlebars
    helpers: require('./lib/handlebars') //el motor 

})); //esto es para las vista de la pagina //en la carpeta layouts
app.set('view engine', '.hbs'); //el motor para utiliza el hbs

//middlewares //para peticiones de usuario
app.use(morgan('dev'));//mesaje por consola //que llega al servidor 
app.use(express.urlencoded({extended: false}));
app.use(express.json()); //para utilizar el json 

//global variables //que variables pueden ser accedidas desde la aplicacion 
app.use((req, res, next) => {

    next(); //toma la info del user y la redireciona para continuar 

});


//Routes // se define las URL que hacen cuando se visite 
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/links', require('./routes/links')); // estos codigo van a dar error si estan vacias las rutas 


//Public // todo el codigo que el navegador puede acceder //carpeta de css, cliente
app.use(express.static(path.join(__dirname, 'public')));

//Starting the server 
app.listen(app.get('port'), () => { //utiliza la sintaxis del puerto anterior
    console.log('Server on port', app.get('port'));
}); //servidor funcionando