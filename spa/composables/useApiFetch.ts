// Docs: https://nuxt.com/docs/api/composables/use-fetch
export default function (fetchFunction: Function, apiPath: string, opts?: object) {
  const config = useRuntimeConfig()
  console.log('%c fetchFunction :', 'background-color:lightgreen', fetchFunction)
  return fetchFunction(apiPath, {
    baseURL: config.public.baseURL,
    ...opts
  })
}
