export const handleError = (error: any) => {
    console.error(`${Date.now()} Error:`, error);
}
export const handleMessage = (message: any) => {
    console.log(`${Date.now()} Log:`, message);
}