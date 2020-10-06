Return-Path: <SRS0=2Xzh=DN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A696DC4363D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 13:27:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129ED207EA
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2020 13:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kEMHMtUf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwRt16v6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129ED207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9v5mUCj3wp+WxpHpML7mudGQTwkOVJII+tlK1vmgBEo=; b=kEMHMtUf+XfRX53XiJ8ea6YSM
	cj9hSmsRp0v/+3QbRJjNh9Olwg47HYJm0N4vO7z87qPu2vICJbQTyCJajNZOAG6IV8qmEIcFlNmk5
	EfZI76tkNbDtDK0Llck/xmOKCLu3lJphOqpPFNnjemzVJr2lrj7DEDtj9wUVt12J/9HjqTgNC24d2
	M/5TtaaMjHeTFnBODWgXpRJJbrHilsIsDel3B5G1eN1J9s6+XVI/6UtjoHvc6pjYNjBCjTFf9o9jW
	OZ0PISWSZOE2i4vUmDsY5SSrH4+Frx346jdrFp8dMN+DOWG6z8xN2azjCRT3M+zGfORUhAkYyNydx
	fF4QdCp6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPmzy-0000Kz-2v; Tue, 06 Oct 2020 13:27:22 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPmzv-0000Jm-Od
 for linux-snps-arc@lists.infradead.org; Tue, 06 Oct 2020 13:27:20 +0000
Received: by mail-qv1-xf42.google.com with SMTP id w5so3856806qvn.12
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Oct 2020 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l4LjyN2cIgnf2fEEb+E1n83Huq6JkiGtxzKiPL+ncKc=;
 b=LwRt16v6ejJnN31lCnLrWHItmcjX7QwcMdxNDcVy3e12uXf+AW+jqiwEh8Sm8e41u8
 vRHPK7H1bcmP5rOW97lwsxhT7whaGhf0p2GWtLpXNR+VaUGF43Gr6qiZrM+darf+mFFE
 g6kSPt8v+dtFG0pbDKyPVKu33fy8mZRHlESioRg+mavZdhKAPG5MK1x1G0S9jpMGA4gF
 Of5Y+5equuSwyebCqTHE8cHFDNGhL3Q3MgzW1HJwlRc3AOLBPNi9Q1kUL9n82DFIENOy
 ft3UqG+2nkc1EUdi/B2gOvh+JpfDkh/2BFRo7gKz3MDYQX8aWbJyI7dzgVsqE6/oyRds
 /n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4LjyN2cIgnf2fEEb+E1n83Huq6JkiGtxzKiPL+ncKc=;
 b=IF8ugy16exvSqhJPsOQN+aCxF4nk+FgSJYf9sVIZb6q6aw1XSbD72vxqtJS9nu5IjH
 Y9xpIOaZLdUUj/HCqJ6QEeDjiDjqnD+JStTUAtftwdPPkjS/oGnxKQoOGvTIKVFwR3Td
 JcpbEfEJdJTpVbPbCdAVj64TLoNxNpegwup/A9Rap8tM20NhfH9eCJyV9jR5ophFzVUy
 oaXAL2DEArhoFAtIJBM0+PKGuMzDnJq5C3bEYLy/VZjrv4YiMoN8asYmaPXF3v8vAuer
 q+QBzXMjZDlh7h2HQR38dyVfjt4fLbDT1KkOrFsSHgku1aaEAt+xFBlZF/QW81jIPO56
 xIPw==
X-Gm-Message-State: AOAM533uUYXIercR8DDmfYrO2VPWLneW96FuHj1ducD/aVbGT2/cwRf4
 HJeLs99DdbbhmTWLxL33D4k=
X-Google-Smtp-Source: ABdhPJzzGuk+QYBUf2awRNgmEyN/0UrFXCT1ZwGdStlZWwoJnjMtq+Iec7kdEOsLbEtJWYx0aAWm0w==
X-Received: by 2002:a0c:fa11:: with SMTP id q17mr4639941qvn.6.1601990836403;
 Tue, 06 Oct 2020 06:27:16 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id b9sm1621812qka.86.2020.10.06.06.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 06:27:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/swsmu: fix ARC build errors
Date: Tue,  6 Oct 2020 09:26:59 -0400
Message-Id: <20201006132659.1486610-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201006132659.1486610-1-alexander.deucher@amd.com>
References: <20201006132659.1486610-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_092719_830820_C2505E9E 
X-CRM114-Status: GOOD (  13.91  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Evan Quan <evan.quan@amd.com>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

We want to use the dev_* functions here rather than the pr_* variants.
Switch to using dev_warn() which mirrors what we do on other asics.

Fixes the following build errors on ARC:

../drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c: In function 'navi10_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

../drivers/gpu/drm/amd/amdgpu/../powerplay/sienna_cichlid_ppt.c: In function 'sienna_cichlid_fill_i2c_req':
../arch/arc/include/asm/bug.h:24:2: error: implicit declaration of function 'pr_warn'; did you mean 'drm_warn'? [-Werror=implicit-function-declaration]

Reported-by: kernel test robot <lkp@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 14 ++++++++++++--
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 3f1377f28493..8d8081c6bd38 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -2336,8 +2336,6 @@ static void navi10_fill_i2c_req(SwI2cRequest_t  *req, bool write,
 {
 	int i;
 
-	BUG_ON(numbytes > MAX_SW_I2C_COMMANDS);
-
 	req->I2CcontrollerPort = 0;
 	req->I2CSpeed = 2;
 	req->SlaveAddress = address;
@@ -2375,6 +2373,12 @@ static int navi10_i2c_read_data(struct i2c_adapter *control,
 	struct smu_table_context *smu_table = &adev->smu.smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	navi10_fill_i2c_req(&req, false, address, numbytes, data);
 
@@ -2411,6 +2415,12 @@ static int navi10_i2c_write_data(struct i2c_adapter *control,
 	SwI2cRequest_t req;
 	struct amdgpu_device *adev = to_amdgpu_device(control);
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	navi10_fill_i2c_req(&req, true, address, numbytes, data);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 3c8732f34b1f..c27806fd07e0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2422,8 +2422,6 @@ static void sienna_cichlid_fill_i2c_req(SwI2cRequest_t  *req, bool write,
 {
 	int i;
 
-	BUG_ON(numbytes > MAX_SW_I2C_COMMANDS);
-
 	req->I2CcontrollerPort = 0;
 	req->I2CSpeed = 2;
 	req->SlaveAddress = address;
@@ -2461,6 +2459,12 @@ static int sienna_cichlid_i2c_read_data(struct i2c_adapter *control,
 	struct smu_table_context *smu_table = &adev->smu.smu_table;
 	struct smu_table *table = &smu_table->driver_table;
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	sienna_cichlid_fill_i2c_req(&req, false, address, numbytes, data);
 
@@ -2497,6 +2501,12 @@ static int sienna_cichlid_i2c_write_data(struct i2c_adapter *control,
 	SwI2cRequest_t req;
 	struct amdgpu_device *adev = to_amdgpu_device(control);
 
+	if (numbytes > MAX_SW_I2C_COMMANDS) {
+		dev_err(adev->dev, "numbytes requested %d is over max allowed %d\n",
+			numbytes, MAX_SW_I2C_COMMANDS);
+		return -EINVAL;
+	}
+
 	memset(&req, 0, sizeof(req));
 	sienna_cichlid_fill_i2c_req(&req, true, address, numbytes, data);
 
-- 
2.25.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
