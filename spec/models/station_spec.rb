require 'rails_helper'

describe Station, 'Instance Methods', type: :service do
  context '#all' do
    it 'returns all stations' do
      expect(subject.all).to eq all_stations
    end
  end

  context '#ns' do
    it 'returns all stations with started code of NS' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'NS'.freeze}.compact
      expect(subject.ns).to match_array stations
    end
  end

  context '#ew' do
    it 'returns all stations with started code of EW' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'EW'.freeze}.compact

      expect(subject.ew).to match_array stations
    end
  end

  context '#cg' do
    it 'returns all stations with started code of CG' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'CG'.freeze}.compact

      expect(subject.cg).to match_array stations
    end
  end

  context '#ne' do
    it 'returns all stations with started code of NE' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'NE'.freeze}.compact

      expect(subject.ne).to match_array stations
    end
  end

  context '#cc' do
    it 'returns all stations with started code of CC' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'CC'.freeze}.compact

      expect(subject.cc).to match_array stations
    end
  end

  context '#dt' do
    it 'returns all stations with started code of DT' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'DT'.freeze}.compact

      expect(subject.dt).to match_array stations
    end
  end

  context '#te' do
    it 'returns all stations with started code of TE' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'TE'.freeze}.compact

      expect(subject.te).to match_array stations
    end
  end

  context '#ce' do
    it 'returns all stations with started code of CE' do
      stations = all_stations.map {|station| station[:label] if station[:code].start_with? 'CE'.freeze}.compact

      expect(subject.ce).to match_array stations
    end
  end

  context '#interchange' do
    it 'returns all the interchange station names' do
      station_names = (subject.ns + subject.ew + subject.cg + subject.ne + subject.cc + subject.dt + subject.te + subject.ce)
      expected_interchange_names = station_names.select {|station_name| station_names.count(station_name) > 1}.uniq

      expect(subject.interchanges).to match_array expected_interchange_names
    end
  end

  context '#code_by_name' do
    it 'returns correct code of the station name' do
      expect(subject.code_by_name('Woodlands')).to eq 'NS9'
    end

    it 'returns nil when the name cannot be found' do
      expect(subject.code_by_name('Any')).to eq nil
    end
  end

  def all_stations
    @all_stations ||= [
      { code: 'NS1', name: 'Jurong East', label: 'NS1-EW24;Jurong East' },
      { code: 'NS2', name: 'Bukit Batok', label: 'NS2;Bukit Batok' },
      { code: 'NS3', name: 'Bukit Gombak', label: 'NS3:Bukit Gombak' },
      { code: 'NS4', name: 'Choa Chu Kang', label: 'NS4:Choa Chu Kang' },
      { code: 'NS5', name: 'Yew Tee', label: 'NS5:Yew Tee' },
      { code: 'NS7', name: 'Kranji', label: 'NS7:Kranji' },
      { code: 'NS8', name: 'Marsiling', label: 'NS8:Marsiling' },
      { code: 'NS9', name: 'Woodlands', label: 'NS9-TE2;Woodlands' },
      { code: 'NS10', name: 'Admiralty', label: 'NS10:Admiralty' },
      { code: 'NS11', name: 'Sembawang', label: 'NS11:Sembawang' },
      { code: 'NS12', name: 'Canberra', label: 'NS12:Canberra' },
      { code: 'NS13', name: 'Yishun', label: 'NS13:Yishun' },
      { code: 'NS14', name: 'Khatib', label: 'NS14:Khatib' },
      { code: 'NS15', name: 'Yio Chu Kang', label: 'NS15:Yio Chu Kang' },
      { code: 'NS16', name: 'Ang Mo Kio', label: 'NS16:Ang Mo Kio' },
      { code: 'NS17', name: 'Bishan', label: 'NS17-CC15:Bishan' },
      { code: 'NS18', name: 'Braddell', label: 'NS18:Braddell' },
      { code: 'NS19', name: 'Toa Payoh', label: 'NS19:Toa Payoh' },
      { code: 'NS20', name: 'Novena', label: 'NS20:Novena' },
      { code: 'NS21', name: 'Newton', label: 'NS21-DT11:Newton' },
      { code: 'NS22', name: 'Orchard', label: 'NS22-TE14:Orchard' },
      { code: 'NS23', name: 'Somerset', label: 'NS23:Somerset' },
      { code: 'NS24', name: 'Dhoby Ghaut', label: 'NS24-NE6-CC1:Dhoby Ghaut' },
      { code: 'NS25', name: 'City Hall', label: 'NS25-EW13:City Hall' },
      { code: 'NS26', name: 'Raffles Place', label: 'NS26-EW14:Raffles Place' },
      { code: 'NS27', name: 'Marina Bay', label: 'NS27-TE20-CE2:Marina Bay' },
      { code: 'NS28', name: 'Marina South Pier', label: 'NS28:Marina South Pier' },
      { code: 'EW1', name: 'Pasir Ris', label: 'EW1:Pasir Ris' },
      { code: 'EW2', name: 'Tampines', label: 'EW2-DT32:Tampines' },
      { code: 'EW3', name: 'Simei', label: 'EW3:Simei' },
      { code: 'EW4', name: 'Tanah Merah', label: 'EW4-CG0:Tanah Merah' },
      { code: 'EW5', name: 'Bedok', label: 'EW5:Bedok' },
      { code: 'EW6', name: 'Kembangan', label: 'EW6:Kembangan' },
      { code: 'EW7', name: 'Eunos', label: 'EW7:Eunos' },
      { code: 'EW8', name: 'Paya Lebar', label: 'EW8-CC9:Paya Lebar' },
      { code: 'EW9', name: 'Aljunied', label: 'EW9:Aljunied' },
      { code: 'EW10', name: 'Kallang', label: 'EW10:Kallang' },
      { code: 'EW11', name: 'Lavender', label: 'EW11:Lavender' },
      { code: 'EW12', name: 'Bugis', label: 'EW12-DT14:Bugis' },
      { code: 'EW13', name: 'City Hall', label: 'NS25-EW13:City Hall'},
      { code: 'EW14', name: 'Raffles Place', label: 'NS26-EW14:Raffles Place' },
      { code: 'EW15', name: 'Tanjong Pagar', label: 'EW15:Tanjong Pagar' },
      { code: 'EW16', name: 'Outram Park', label: 'EW16-NE3-TE17:Outram Park' },
      { code: 'EW17', name: 'Tiong Bahru', label: 'EW17:Tiong Bahru' },
      { code: 'EW18', name: 'Redhill', label: 'EW18:Redhill' },
      { code: 'EW19', name: 'Queenstown', label: 'EW19:Queenstown' },
      { code: 'EW20', name: 'Commonwealth', label: 'EW20:Commonwealth' },
      { code: 'EW21', name: 'Buona Vista', label: 'EW21-CC22:Buona Vista' },
      { code: 'EW22', name: 'Dover', label: 'EW22:Dover' },
      { code: 'EW23', name: 'Clementi', label: 'EW23:Clementi' },
      { code: 'EW24', name: 'Jurong East', label: 'NS1-EW24;Jurong East' },
      { code: 'EW25', name: 'Chinese Garden', label: 'EW25:Chinese Garden' },
      { code: 'EW26', name: 'Lakeside', label: 'EW26:Lakeside' },
      { code: 'EW27', name: 'Boon Lay', label: 'EW27:Boon Lay' },
      { code: 'EW28', name: 'Pioneer', label: 'EW28:Pioneer' },
      { code: 'EW29', name: 'Joo Koon', label: 'EW29:Joo Koon' },
      { code: 'EW30', name: 'Gul Circle', label: 'EW30:Gul Circle' },
      { code: 'EW31', name: 'Tuas Crescent', label: 'EW31:Tuas Crescent' },
      { code: 'EW32', name: 'Tuas West Road', label: 'EW32:Tuas West Road' },
      { code: 'EW33', name: 'Tuas Link', label: 'EW33:Tuas Link' },
      { code: 'CG0', name: 'Tanah Merah', label: 'EW4-CG0:Tanah Merah' },
      { code: 'CG1', name: 'Expo', label: 'CG1-DT35:Expo' },
      { code: 'CG2', name: 'Changi Airport', label: 'CG2:Changi Airport' },
      { code: 'NE1', name: 'HarbourFront', label: 'NE1-CC29:HarbourFront' },
      { code: 'NE3', name: 'Outram Park', label: 'EW16-NE3-TE17:Outram Park' },
      { code: 'NE4', name: 'Chinatown', label: 'NE4-DT19:Chinatown' },
      { code: 'NE5', name: 'Clarke Quay', label: 'NE5:Clarke Quay' },
      { code: 'NE6', name: 'Dhoby Ghaut', label: 'NS24-NE6-CC1:Dhoby Ghaut' },
      { code: 'NE7', name: 'Little India', label: 'NE7-DT12:Little India' },
      { code: 'NE8', name: 'Farrer Park', label: 'NE8:Farrer Park' },
      { code: 'NE9', name: 'Boon Keng', label: 'NE9:Boon Keng' },
      { code: 'NE10', name: 'Potong Pasir', label: 'NE10:Potong Pasir' },
      { code: 'NE11', name: 'Woodleigh', label: 'NE11:Woodleigh' },
      { code: 'NE12', name: 'Serangoon', label: 'NE12-CC13:Serangoon' },
      { code: 'NE13', name: 'Kovan', label: 'NE13:Kovan' },
      { code: 'NE14', name: 'Hougang', label: 'NE14:Hougang' },
      { code: 'NE15', name: 'Buangkok', label: 'NE15:Buangkok' },
      { code: 'NE16', name: 'Sengkang', label: 'NE16:Sengkang' },
      { code: 'NE17', name: 'Punggol', label: 'NE17:Punggol' },
      { code: 'CC1', name: 'Dhoby Ghaut', label: 'NS24-NE6-CC1:Dhoby Ghaut' },
      { code: 'CC2', name: 'Bras Basah', label: 'CC2:Bras Basah' },
      { code: 'CC3', name: 'Esplanade', label: 'CC3:Esplanade' },
      { code: 'CC4', name: 'Promenade', label: 'CC4-DT15-CE0:Promenade' },
      { code: 'CC5', name: 'Nicoll Highway', label: 'CC5:Nicoll Highway' },
      { code: 'CC6', name: 'Stadium', label: 'CC6:Stadium' },
      { code: 'CC7', name: 'Mountbatten', label: 'CC7:Mountbatten' },
      { code: 'CC8', name: 'Dakota', label: 'CC8:Dakota' },
      { code: 'CC9', name: 'Paya Lebar', label: 'EW8-CC9:Paya Lebar' },
      { code: 'CC10', name: 'MacPherson', label: 'CC10-DT26:MacPherson' },
      { code: 'CC11', name: 'Tai Seng', label: 'CC11:Tai Seng' },
      { code: 'CC12', name: 'Bartley', label: 'CC12:Bartley' },
      { code: 'CC13', name: 'Serangoon', label: 'NE12-CC13:Serangoon' },
      { code: 'CC14', name: 'Lorong Chuan', label: 'CC14:Lorong Chuan' },
      { code: 'CC15', name: 'Bishan', label: 'NS17-CC15:Bishan' },
      { code: 'CC16', name: 'Marymount', label: 'CC16:Marymount' },
      { code: 'CC17', name: 'Caldecott', label: 'CC17-TE9:Caldecott' },
      { code: 'CC19', name: 'Botanic Gardens', label: 'CC19-DT9:Botanic Gardens' },
      { code: 'CC20', name: 'Farrer Road', label: 'CC20:Farrer Road' },
      { code: 'CC21', name: 'Holland Village', label: 'CC21:Holland Village' },
      { code: 'CC22', name: 'Buona Vista', label: 'EW21-CC22:Buona Vista' },
      { code: 'CC23', name: 'one-north', label: 'CC23:one-north' },
      { code: 'CC24', name: 'Kent Ridge', label: 'CC24:Kent Ridge' },
      { code: 'CC25', name: 'Haw Par Villa', label: 'CC25:Haw Par Villa' },
      { code: 'CC26', name: 'Pasir Panjang', label: 'CC26:Pasir Panjang' },
      { code: 'CC27', name: 'Labrador Park', label: 'CC27:Labrador Park' },
      { code: 'CC28', name: 'Telok Blangah', label: 'CC28:Telok Blangah' },
      { code: 'CC29', name: 'HarbourFront', label: 'NE1-CC29:HarbourFront' },
      { code: 'DT1', name: 'Bukit Panjang', label: 'DT1:Bukit Panjang' },
      { code: 'DT2', name: 'Cashew', label: 'DT2:Cashew' },
      { code: 'DT3', name: 'Hillview', label: 'DT3:Hillview' },
      { code: 'DT5', name: 'Beauty World', label: 'DT5:Beauty World' },
      { code: 'DT6', name: 'King Albert Park', label: 'DT6:King Albert Park' },
      { code: 'DT7', name: 'Sixth Avenue', label: 'DT7:Sixth Avenue' },
      { code: 'DT8', name: 'Tan Kah Kee', label: 'DT8:Tan Kah Kee' },
      { code: 'DT9', name: 'Botanic Gardens', label: 'CC19-DT9:Botanic Gardens' },
      { code: 'DT10', name: 'Stevens', label: 'DT10-TE11:Stevens' },
      { code: 'DT11', name: 'Newton', label: 'NS21-DT11:Newton' },
      { code: 'DT12', name: 'Little India', label: 'NE7-DT12:Little India' },
      { code: 'DT13', name: 'Rochor', label: 'DT13:Rochor' },
      { code: 'DT14', name: 'Bugis', label: 'EW12-DT14:Bugis' },
      { code: 'DT15', name: 'Promenade', label: 'CC4-DT15-CE0:Promenade' },
      { code: 'DT16', name: 'Bayfront', label: 'DT16-CE1:Bayfront' },
      { code: 'DT17', name: 'Downtown', label: 'DT17:Downtown' },
      { code: 'DT18', name: 'Telok Ayer', label: 'DT18:Telok Ayer' },
      { code: 'DT19', name: 'Chinatown', label: 'NE4-DT19:Chinatown' },
      { code: 'DT20', name: 'Fort Canning', label: 'DT20:Fort Canning' },
      { code: 'DT21', name: 'Bencoolen', label: 'DT21:Bencoolen' },
      { code: 'DT22', name: 'Jalan Besar', label: 'DT22:Jalan Besar' },
      { code: 'DT23', name: 'Bendemeer', label: 'DT23:Bendemeer' },
      { code: 'DT24', name: 'Geylang Bahru', label: 'DT24:Geylang Bahru' },
      { code: 'DT25', name: 'Mattar', label: 'DT25:Mattar' },
      { code: 'DT26', name: 'MacPherson', label: 'CC10-DT26:MacPherson' },
      { code: 'DT27', name: 'Ubi', label: 'DT27:Ubi' },
      { code: 'DT28', name: 'Kaki Bukit', label: 'DT28:Kaki Bukit' },
      { code: 'DT29', name: 'Bedok North', label: 'DT29:Bedok North' },
      { code: 'DT30', name: 'Bedok Reservoir', label: 'DT30:Bedok Reservoir' },
      { code: 'DT31', name: 'Tampines West', label: 'DT31:Tampines West' },
      { code: 'DT32', name: 'Tampines', label: 'DT32:Tampines' },
      { code: 'DT33', name: 'Tampines East', label: 'DT33:Tampines East' },
      { code: 'DT34', name: 'Upper Changi', label: 'DT34:Upper Changi' },
      { code: 'DT35', name: 'Expo', label: 'CG1-DT35:Expo' },
      { code: 'TE1', name: 'Woodlands North', label: 'TE1:Woodlands North' },
      { code: 'TE2', name: 'Woodlands', label: 'NS9-TE2;Woodlands' },
      { code: 'TE3', name: 'Woodlands South', label: 'TE3:Woodlands South' },
      { code: 'TE4', name: 'Springleaf', label: 'TE4:Springleaf' },
      { code: 'TE5', name: 'Lentor', label: 'TE5:Lentor' },
      { code: 'TE6', name: 'Mayflower', label: 'TE6:Mayflower' },
      { code: 'TE7', name: 'Bright Hill', label: 'TE7:Bright Hill' },
      { code: 'TE8', name: 'Upper Thomson', label: 'TE8:Upper Thomson' },
      { code: 'TE9', name: 'Caldecott', label: 'CC17-TE9:Caldecott' },
      { code: 'TE10', name: 'Mount Pleasant', label: 'TE10:Mount Pleasant' },
      { code: 'TE11', name: 'Stevens', label: 'DT10-TE11:Stevens' },
      { code: 'TE12', name: 'Napier', label: 'TE12:Napier' },
      { code: 'TE13', name: 'Orchard Boulevard', label: 'TE13:Orchard Boulevard' },
      { code: 'TE14', name: 'Orchard', label: 'NS22-TE14:Orchard' },
      { code: 'TE15', name: 'Great World', label: 'TE15:Great World' },
      { code: 'TE16', name: 'Havelock', label: 'TE16:Havelock' },
      { code: 'TE17', name: 'Outram Park', label: 'EW16-NE3-TE17:Outram Park' },
      { code: 'TE18', name: 'Maxwell', label: 'TE18:Maxwell' },
      { code: 'TE19', name: 'Shenton Way', label: 'TE19:Shenton Way' },
      { code: 'TE20', name: 'Marina Bay', label: 'NS27-TE20-CE2:Marina Bay' },
      { code: 'TE21', name: 'Marina South', label: 'TE21:Marina South' },
      { code: 'TE2', name: 'Gardens by the Bay', label: 'TE2:Gardens by the Bay' },
      { code: 'CE0', name: 'Promenade', label: 'CC4-DT15-CE0:Promenade' },
      { code: 'CE1', name: 'Bayfront', label: 'DT16-CE1:Bayfront' },
      { code: 'CE2', name: 'Marina Bay', label: 'NS27-TE20-CE2:Marina Bay' }
    ]
  end
end
