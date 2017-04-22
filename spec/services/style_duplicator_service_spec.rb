require "rails_helper"

describe StyleDuplicatorService do
  let!(:old_style){Style.create(
                      vendor_style_number: '1234567',
                      status: 3,
                      notes: 'hey there notes',
                      negotiated_cost: 56.56,
                      exclusive: false
                    )
                  }
  let(:service){ StyleDuplicatorService.new(old_style.id) }
  
  it 'should duplicate the original style' do
    duplicated_style = service.perform
    expect(duplicated_style.exclusive).to eq false
    expect(duplicated_style.notes).to eq 'hey there notes'
  end

  context 'when the style number does not exist elsewhere' do
    it 'should increment the vendor style number by (1)' do
      duplicated_style = service.perform
      expect(duplicated_style.vendor_style_number)
      .to eq '1234567(1)'
    end
  end

  context 'when the style number exists with a previous duplication' do
    let!(:old_style){Style.create(
                        vendor_style_number: '1234567(1)',
                        status: 3,
                        notes: 'hey there notes',
                        negotiated_cost: 56.56,
                        exclusive: false
                      )
                    }
    let(:service){ StyleDuplicatorService.new(old_style.id) }

    it 'should show the second duplication by (2)' do
      duplicated_style = service.perform
      expect(duplicated_style.vendor_style_number)
      .to eq '1234567(2)'
    end
  end

end