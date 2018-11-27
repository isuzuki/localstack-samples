export async function handler(event: any, context: any, callback: any) {
    console.log(event)
    console.log(context)
    console.log(callback)

    return "Hello index ts lambda."
}