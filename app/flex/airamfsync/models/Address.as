package airamfsync.models {
  
  import org.restfulx.models.RxModel;
  import org.restfulx.collections.ModelsCollection;
  
  [Resource(name="addresses")]
  [Bindable]
  public class Address extends RxModel {
    public static const LABEL:String = "lineOne";

    public var lineOne:String = "";

    public var lineTwo:String = "";

    public var city:String = "";

    public var zip:String = "";

    public var state:String = "";

    public var country:String = "";

    [Lazy]
    [BelongsTo(polymorphic="true", dependsOn="Business, Person", referAs="addresses")]
    public var owner:Object;
    
    [HasMany]
    public var locations:ModelsCollection;

    public function Address() {
      super(LABEL);
    }
  }
}
