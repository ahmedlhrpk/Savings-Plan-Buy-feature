import { Construct } from 'constructs';
import { ApiConstruct } from './api-gateway';
import { DatabaseConstruct } from './database';
import { EventsConstruct } from './events';

export interface UserConfigurationProps {
  readonly stage: string;
}

export class UserConfiguration extends Construct {
  public readonly apiUrl: string;
  
  constructor(scope: Construct, id: string, props: UserConfigurationProps) {
    super(scope, id);

    // Database
    const database = new DatabaseConstruct(this, 'Database');

    // Event Bus
    const events = new EventsConstruct(this, 'Events');

    // API Gateway with Lambda
    const api = new ApiConstruct(this, 'Api', {
      stage: props.stage,
      table: database.table,
      eventBus: events.eventBus
    });

    this.apiUrl = api.api.url;
  }
}
