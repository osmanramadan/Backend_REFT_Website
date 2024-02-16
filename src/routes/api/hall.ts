import express from 'express';
import HallController from '../../controller/hall';
// import verify from '../../authorization/middelware/jwtmiddelware';
import { addhallValidator } from '../../utils/validator/hallValidator';
import uploadImageController from '../../authorization/middelware/imageupload';


const hallcontroller = new HallController();
const UploadImageController = new uploadImageController();

const hall: express.Router = express.Router();

hall.get('/'           ,  hallcontroller.index);
hall.post('/add'       ,  UploadImageController.uploadSingleImage, UploadImageController.resizeimage , addhallValidator ,  hallcontroller.create);
hall.post('/delete/:id',  hallcontroller.delete);
hall.put('/update'     ,  hallcontroller.update);

export default hall;
