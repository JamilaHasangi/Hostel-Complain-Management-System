package com.uor.fot.Complain.Management.System.repository;

import com.uor.fot.Complain.Management.System.model.Asset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AssetRepository extends JpaRepository<Asset, Long> {
    @Query("SELECT a FROM Asset a WHERE a.id = :id")
    Asset getAssetById(@Param("id") Long id);
}

