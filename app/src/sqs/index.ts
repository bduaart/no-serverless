import {handleError, handleMessage} from "../utils/logger";

export const processSQSHandler = async (event: any): Promise<any> => {
    try {
        for (const record of event.Records) {
            handleMessage(`Processing SQS message: ${record.body}`);
        }
        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Messages processed successfully" }),
        };
    } catch (e) {
        handleError(e);
        return {
            statusCode: 500,
            body: JSON.stringify({ error: "Failed to process messages" }),
        };
    }
};
