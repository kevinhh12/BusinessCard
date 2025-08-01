const supabase = require('../services/supabaseClient');

exports.createCard = async (req, res) => {
  const { userId, ...cardData } = req.body;

  if (!userId) {
    return res.status(400).json({ error: 'userId is required' });
  }

  const { data, error } = await supabase
    .from('business_cards')
    .insert([{ user_id: userId, ...cardData }])
    .select();

  if (error) return res.status(400).json({ error });
  res.json(data);
};

exports.getCardsByUser = async (req, res) => {
  const { userId } = req.params;

  const { data, error } = await supabase
    .from('business_cards')
    .select('*')
    .eq('user_id', userId);

  if (error) return res.status(400).json({ error });
  res.json(data);
};
