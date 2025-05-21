import { DynamoDB } from 'aws-sdk';

const dynamo = new DynamoDB.DocumentClient();
const TABLE_NAME = process.env.PLANS_TABLE_NAME!;

export const main = async (event: any) => {
  console.log('Received event:', JSON.stringify(event));

  try {
    const body = JSON.parse(event.body);
    const { userId, planId, amount, schedule } = body;

    if (!userId || !planId || !amount || !schedule) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: 'Missing required fields' }),
      };
    }

    await dynamo.put({
      TableName: TABLE_NAME,
      Item: {
        userId,
        planId,
        amount,
        schedule,
        createdAt: new Date().toISOString(),
      },
    }).promise();

    return {
      statusCode: 200,
      body: JSON.stringify({ message: 'Savings plan created successfully' }),
    };
  } catch (error) {
    console.error('Error processing savings plan:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Internal Server Error' }),
    };
  }
};
