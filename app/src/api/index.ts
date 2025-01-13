import {handleError, handleMessage} from "../utils/logger";

export const processApiHandler = async (event: any): Promise<any> => {
    try {
        handleMessage(`Executing API`);
        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Successfully executed" }),
        };
    } catch (e) {
        handleError(e);
        return {
            statusCode: 500,
            body: JSON.stringify({ error: "Internal Server Error" }),
        };
    }
};
