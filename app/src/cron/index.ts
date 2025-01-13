import {handleError, handleMessage} from "../utils/logger";

export const processSchedulerHandler = async (event: any): Promise<any> => {
    try {
        handleMessage(`Executing scheduled task`);
        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Scheduled task executed successfully" }),
        };
    } catch (e) {
        handleError(e);
        return {
            statusCode: 500,
            body: JSON.stringify({ error: "Failed execute scheduled task" }),
        };
    }
};
