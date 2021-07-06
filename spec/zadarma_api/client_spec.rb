# frozen_string_literal: true

RSpec.describe ZadarmaApi::Client do
  subject(:client_class) { described_class }

  let(:key) {  ENV.fetch('API_TEST_KEY', 'api_test_key') }
  let(:secret) { ENV.fetch('API_TEST_SECRET', 'api_test_secret') }
  let(:client) { subject.new(key: key, secret: secret) }

  it 'client simple config key' do
    expect(client.key).to eq(key)
  end

  it 'client simple config secret' do
    expect(client.secret).to eq(secret)
  end

  describe 'version' do
    it 'default config version v1' do
      expect(client.api_version).to eq('v1')
    end

    it 'seted api version' do
      client = client_class.new(key: key, secret: secret, api_version: 'v3')
      expect(client.api_version).to eq('v3')
    end
  end

  describe 'url' do
    it 'default config production' do
      expect(client.url).to eq(client_class::PROD_URL)
    end

    it 'sandbox' do
      client = client_class.new(key: key, secret: secret, is_sandbox: true)
      expect(client.url).to eq(client_class::SANDBOX_URL)
    end
  end

  describe '#call', :vcr do
    context 'when get' do
      let(:balance_message) { { 'balance' => 0, 'currency' => 'RUB', 'status' => 'success' } }

      it 'get method' do
        expect(client.call('/info/balance/', 'get').body).to eq(balance_message)
      end
    end

    context 'when post' do
      let(:sms_send_message) { { 'message' => 'There are less than 25 cents on your balance', 'status' => 'error' } }
      let(:params) { { number: '12345', message: 'Hello' } }

      it 'post method' do
        expect(client.call('/sms/send/', 'POST', params).body).to eq(sms_send_message)
      end
    end
  end
end
