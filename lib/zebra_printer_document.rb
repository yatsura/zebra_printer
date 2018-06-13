class ZebraPrinterDocument
  def initialize(data=nil, &block)
    @language = :epl2
    @data = data
    if block_given?
      instance_eval(&block)
    end
  end

  def language(lang)
    @language = lang
    @language_processor = nil
  end

  def language_processor
    @language_processor ||= Languages.const_get(@language.to_s.capitalize).new data
  end

  def process(&block)
    instance_eval(&block)
    self
  end

  def document
    language_processor.document
  end

  def data
    @data
  end

  def to_str
    document
  end

  def method_missing(method,*args,&block)
    if language_processor.respond_to? method
      if block_given?
        language_processor.public_send(method,*args,&block)
      else
        language_processor.public_send(method,*args)
      end
    else
      super(method,*args,&block)
    end
  end

  def respond_to?(method)
    language_processor.respond_to?(method) || super(method)
  end
end
