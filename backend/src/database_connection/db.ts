import dotenv from 'dotenv';
import { Pool } from 'pg';

dotenv.config();

const {
  POSTGRES_HOST,
  DEV_POSTGRES_DB,
  TEST_POSTGRES_DB,
  POSTGRES_USER,
  POSTGRES_PASSWORD,
  NODE_ENV
} = process.env;

let pool;

if (NODE_ENV === 'test') {
  pool = new Pool({
    host: POSTGRES_HOST,
    database: TEST_POSTGRES_DB,
    user: POSTGRES_USER,
    password: POSTGRES_PASSWORD,
    port: 5433
  });
}


if (NODE_ENV === 'dev') {
  pool = new Pool({
  host: POSTGRES_HOST,
  database: DEV_POSTGRES_DB,
  user: POSTGRES_USER,
  password: POSTGRES_PASSWORD,
  port: 5433
  });
}

// if (NODE_ENV === 'dev') {
//   const pool = new Pool({
//     connectionString: "postgres://reftreft:DTZP2yVvBk2r5u7lI0QHesrPWmbuRrZD@dpg-cne14if109ks738tgq60-a.oregon-postgres.render.com/reft",
//     ssl: {
//       rejectUnauthorized: false
//     }
//   });

//   pool.connect()
//     .then((client) => {
//       console.log("Connected to PostgreSQL");
//       // You can use 'client' to execute queries or simply release the client
//       client.release();
//     })
//     .catch((err) => {
//       console.error("Error connecting to PostgreSQL:", err);
//     });
// }


export default pool;
