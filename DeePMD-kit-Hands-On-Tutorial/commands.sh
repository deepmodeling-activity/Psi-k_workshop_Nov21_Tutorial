dp train input.json
dp freeze
dp convert-from -i frozen_model.pb -o convert_out.pb 1.3
dp compress -i convert_out.pb -o compressed.pb -t input.json
dp test -s ../test_data/ -d test.out --shuffle-test --shuffle-test -r 234 -m compressed.pb
