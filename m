Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DD3C54E4A
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Mar 2024 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MlFm411Z0tjisIySEoPvkFaChNzsTqTvOna+ubVTd74=; b=LPbWA4uu6RcqPn+gGKrhOa/F7v
	jZX2afIr+hwhLk1hN3q1rU+BEAO83GV4tn/+mlWPobvT6cGr9LeZs4QzKX2F1njSyiDaxOBNW/l/f
	ok1WZlZMLRnNIE3jzJ+mUK4be/84TjLmg8puw0JCX6nVM26P/YW54OEhZOLWYMBBal9rdfQcsITNp
	a60DkC87EDxqD4uIFgnaJ9JQUe06F4bmaHhgWHFy2CYMHL2wbD7H94ipzt2YbvGIzidaQR3+pnMif
	WUTfa4KeM/61rEDa62NR7jTkhtLnRghQbV9D2EHPn5FPJLR7niaw4lvicdEu/PHBPl7zFoJUNuZ6N
	ZI3XfAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riR3u-00000007YUa-2cc5;
	Fri, 08 Mar 2024 03:38:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riR3r-00000007YSn-2M9O
	for linux-snps-arc@lists.infradead.org;
	Fri, 08 Mar 2024 03:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 816A7616F8;
	Fri,  8 Mar 2024 03:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F4CC433F1;
	Fri,  8 Mar 2024 03:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709869098;
	bh=8Ut/HJVz+mHmfuPuFyi8iubl66qlZqHRc5BShFqhLdA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pT+PbecWuHgv6dp1SYNRPGCopVGFpPzjDBIzy5IT79QDLfDhqYufzY1AOinafuLtA
	 tPSkcgnEjEPxIj2jjofirrSpGbplgHEeXNdsOESC0MnaFItFiJl0mr/N7UZyCqdqRO
	 qGQuHraZn+yh0B+lqk+W/yjWgtyjorzD8d/1ySzl2jHP+LBcCc2wIJKw4QXoOpQc86
	 zW60XfcycXQPRV365x9L1vVHf8YkqQoQJpLF6CmP7zQoDWxKqttORb5kMBZggDF4Zw
	 9j8hJVrqnUL6N/BotB1NtJyViRbt/OA7lCey7J5pPZQzuC36XSaogTCZ67Z6N4269P
	 u6jfTli8uYg6Q==
Date: Thu, 07 Mar 2024 21:38:17 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com, 
 vgupta@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, linux-snps-arc@lists.infradead.org
In-Reply-To: <20240308021842.1975-1-dorine.a.tipo@gmail.com>
References: <20240308021842.1975-1-dorine.a.tipo@gmail.com>
Message-Id: <170986909603.3525341.12390422749723437881.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pct: Convert to dtschema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_193819_673391_52E133F6 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


On Fri, 08 Mar 2024 02:18:42 +0000, Dorine Tipo wrote:
> convert the PCT Arc Performance Counter bindings to DT schema
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  .../devicetree/bindings/arc/pct.yaml          | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arc/pct.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arc/pct.example.dtb: pmu: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/pct.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240308021842.1975-1-dorine.a.tipo@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
