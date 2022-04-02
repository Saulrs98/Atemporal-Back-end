require('dotenv').config()
export const globalConfig = {
  DEV: {
    databaseConfig: {
      client: 'mysql',
      host: '127.0.0.1',
      database: 'atemporal',
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD_DEV,
      port: 3307
    },
    cloudinay: {
      cloud_name: '',
      api_key: process.env.CLOUDINARY_API_KEY,
      api_secret: process.env.CLOUDINARY_API_SECRET,
      secure: true
    },
    jwt_token: { privateKey: 'password' },
    PORT: 4000
  },
  PRODUCTION: {
    databaseConfig: {
      ssl: { rejectUnauthorized: false },
      connectionString: process.env.DATABASE_URL
    },
    cloudinay: {
      cloud_name: '',
      api_key: process.env.CLOUDINARY_API_KEY,
      api_secret: process.env.CLOUDINARY_API_SECRET,
      secure: true
    },
    jwt_token: { privateKey: process.env.JWT_KEY },
    PORT: process.env.PORT
  }
}

export const MODE = process.env.NODE_ENV === 'production' ? 'PRODUCTION' : 'DEV'

export default globalConfig[MODE]
