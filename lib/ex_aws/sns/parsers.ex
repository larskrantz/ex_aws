if Code.ensure_loaded?(SweetXml) do
  defmodule ExAws.SNS.Parsers do
    import SweetXml, only: [sigil_x: 2]

    def parse({:ok, %{body: xml}=resp}, :list_topics) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//ListTopicsResponse",
                        topics: ~x"./ListTopicsResult/Topics/member/TopicArn/text()"sl,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :create_topic) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//CreateTopicResponse",
                        topic_arn: ~x"./CreateTopicResult/TopicArn/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :get_topic_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//GetTopicAttributesResponse",
                        topic_arn: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'TopicArn']/value/text()"s,
                        owner: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'Owner']/value/text()"s,
                        policy: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'Policy']/value/text()"s,
                        display_name: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'DisplayName']/value/text()"s,
                        subscriptions_pending: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'SubscriptionsPending']/value/text()"i,
                        subscriptions_confirmed: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'SubscriptionsConfirmed']/value/text()"i,
                        subscriptions_deleted: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'SubscriptionsDeleted']/value/text()"i,
                        delivery_policy: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'Delivery_policy']/value/text()"s,
                        effective_delivery_policy: ~x"./GetTopicAttributesResult/Attributes/entry[./key = 'EffectiveDeliveryPolicy']/value/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :set_topic_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//SetTopicAttributesResponse",
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :delete_topic) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//DeleteTopicResponse",
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :publish) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//PublishResponse",
                        message_id: ~x"./PublishResult/MessageId/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :create_platform_application) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//CreatePlatformApplicationResponse",
                        platform_application_arn: ~x"./CreatePlatformApplicationResult/PlatformApplicationArn/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :delete_platform_application) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//DeletePlatformApplicationResponse",
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :create_platform_endpoint) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//CreatePlatformEndpointResponse",
                        endpoint_arn: ~x"./CreatePlatformEndpointResult/EndpointArn/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :list_platform_applications) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//ListPlatformApplicationsResponse",
                        applications: [
                          ~x"./ListPlatformApplicationsResult/PlatformApplications/member"l,
                          attributes: [
                            ~x"./Attributes/entry"l,
                            key: ~x"./key/text()"s,
                            value: ~x"./value/text()"s
                          ],
                          platform_application_arn: ~x"./PlatformApplicationArn/text()"s
                        ],
                        next_token: ~x"./ListPlatformApplicationsResult/NextToken/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :get_platform_application_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(
        ~x"//GetPlatformApplicationAttributesResponse",
        event_endpoint_created: ~x"./GetPlatformApplicationAttributesResult/Attributes/entry[./key = 'EventEndpointCreated']/value/text()"s,
        event_endpoint_deleted: ~x"./GetPlatformApplicationAttributesResult/Attributes/entry[./key = 'EventEndpointDeleted']/value/text()"s,
        event_endpoint_updated: ~x"./GetPlatformApplicationAttributesResult/Attributes/entry[./key = 'EventEndpointUpdated']/value/text()"s,
        event_delivery_failure: ~x"./GetPlatformApplicationAttributesResult/Attributes/entry[./key = 'EventDeliveryFailure']/value/text()"s,
        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :subscribe) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//SubscribeResponse",
                        subscription_arn: ~x"./SubscribeResult/SubscriptionArn/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :confirm_subscription) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//ConfirmSubscriptionResponse",
                        subscription_arn: ~x"./ConfirmSubscriptionResult/SubscriptionArn/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :list_subscriptions) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//ListSubscriptionsResponse",
                        subscriptions: [
                          ~x"./ListSubscriptionsResult/Subscriptions/member"l,
                          owner: ~x"./Owner/text()"s,
                          endpoint: ~x"./Endpoint/text()"s,
                          protocol: ~x"./Protocol/text()"s,
                          subscription_arn: ~x"./SubscriptionArn/text()"s,
                          topic_arn: ~x"./TopicArn/text()"s,
                        ],
                        next_token: ~x"./ListSubscriptionsResult/NextToken/text()"s,
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :unsubscribe) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//UnsubscribeResponse",
                        request_id: request_id_xpath())
      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :get_subscription_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(
        ~x"//GetSubscriptionAttributesResponse",
        subscription_arn: ~x"./GetSubscriptionAttributesResult/Attributes/entry[./key = 'SubscriptionArn']/value/text()"s,
        topic_arn: ~x"./GetSubscriptionAttributesResult/Attributes/entry[./key = 'TopicArn']/value/text()"s,
        owner: ~x"./GetSubscriptionAttributesResult/Attributes/entry[./key = 'Owner']/value/text()"s,
        confirmation_was_authenticated: ~x"./GetSubscriptionAttributesResult/Attributes/entry[./key = 'ConfirmationWasAuthenticated']/value/text()"s,
        delivery_policy: ~x"./GetSubscriptionAttributesResult/Attributes/entry[./key = 'DeliveryPolicy']/value/text()"s,
        effective_delivery_policy: ~x"./GetSubscriptionAttributesResult/Attributes/entry[./key = 'EffectiveDeliveryPolicy']/value/text()"s,
        request_id: request_id_xpath())

      parsed_body = Map.put(parsed_body, :confirmation_was_authenticated, parsed_body[:confirmation_was_authenticated] == "true")

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :set_subscription_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//SetSubscriptionAttributesResponse",
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :get_endpoint_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//GetEndpointAttributesResponse",
                        custom_user_data: ~x"./GetEndpointAttributesResult/Attributes/entry[./key = 'CustomUserData']/value/text()"s,
                        enabled: ~x"./GetEndpointAttributesResult/Attributes/entry[./key = 'Enabled']/value/text()"s,
                        token: ~x"./GetEndpointAttributesResult/Attributes/entry[./key = 'Token']/value/text()"s,
                        request_id: request_id_xpath())

      parsed_body = Map.put(parsed_body, :enabled, parsed_body[:enabled] == "true")

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :set_endpoint_attributes) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//SetEndpointAttributesResponse",
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:ok, %{body: xml}=resp}, :delete_endpoint) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//DeleteEndpointResponse",
                        request_id: request_id_xpath())

      {:ok, Map.put(resp, :body, parsed_body)}
    end

    def parse({:error, {type, http_status_code, %{body: xml}}}, _) do
      parsed_body = xml
      |> SweetXml.xpath(~x"//ErrorResponse",
                        request_id: ~x"./RequestId/text()"s,
                        type: ~x"./Error/Type/text()"s,
                        code: ~x"./Error/Code/text()"s,
                        message: ~x"./Error/Message/text()"s,
                        detail: ~x"./Error/Detail/text()"s)

      {:error, {type, http_status_code, parsed_body}}
    end

    def parse(val, _), do: val

    defp request_id_xpath do
      ~x"./ResponseMetadata/RequestId/text()"s
    end
  end
else
  defmodule ExAws.SNS.Parsers do
    def parse(val, _), do: val
  end
end
