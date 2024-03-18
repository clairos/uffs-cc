package com.br.projetointegrador.baraabbAPI.DTO;

import java.util.Objects;

public abstract class AbstractDTO {
	
	@Override
	public boolean equals(Object other) {
		if (other instanceof AbstractDTO) {
			AbstractDTO otherModel = (AbstractDTO) other;
			return Objects.equals(getId(), otherModel.getId());
		}
		return false;
	}

	public abstract Long getId();

}
