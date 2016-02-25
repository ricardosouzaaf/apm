var BoletoTable = React.createClass({

  propTypes: {
    boletos: React.PropTypes.array.isRequired,
    onDelete: React.PropTypes.func.isRequired,
    onEdit: React.PropTypes.func.isRequired
  },

  render: function() {
    var boletosIds = this.props.boletos.map(boleto => boleto.id);
    var link = "#";
    if (boletosIds.length > 0) { link = "/boletos/generate_many." + boletosIds }

    return (
        <div>

          <div className="row">
            <h4>Últimos Boletos Gerados</h4>
          </div>

          <table className="bordered">

            <thead>
            <tr>
              <th>Data</th>
              <th>Vencimento</th>
              <th>NF</th>
              <th>Cliente</th>
              <th>Valor</th>
              
              <th></th>
            </tr>
            </thead>

            {this.props.boletos.map(boleto =>
                    <ReactCSSTransitionGroup transitionName="boletoTable" component="tbody" key={boleto.id}>
                      <BoletoTableLine boleto={boleto} key={boleto.id} onDelete={this.props.onDelete} onEdit={this.props.onEdit}/>
                    </ReactCSSTransitionGroup>
            )}

          </table>
        </div>
    );
  }
});
