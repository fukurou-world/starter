// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  server: {
    proxy: {
      "/api/": {
        target: "http://localhost:3000",
        changeOrigin: true,
        secure: false
        // rewrite: (path: any) => path.replace(/^\/api/, ""),
      },
    },
  },
})
