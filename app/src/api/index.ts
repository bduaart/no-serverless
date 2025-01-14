import {handleError, handleMessage} from "../utils/logger";

export const processApiHandler = async (event: any): Promise<any> => {
    try {
        handleMessage(`Executing API`);
        const httpMethod = event.httpMethod;

        if (httpMethod === 'GET') {
            handleMessage("GET Brunão request");

            return {
                statusCode: 200,
                body: JSON.stringify({ message: "GET executed successfully" }),
            };
        }
        if (httpMethod === 'POST') {
            handleMessage("POST Brunão request");

            return {
                statusCode: 200,
                body: JSON.stringify({ message: "POST executed successfully" }),
            };
        }
        return {
            statusCode: 405,
            body: JSON.stringify({ error: `Method ${httpMethod} not allowed` }),
        };
    } catch (e) {
        handleError(e);
        return {
            statusCode: 500,
            body: JSON.stringify({ error: "Internal Server Error" }),
        };
    }
};
