Return-Path: <SRS0=uiT2=7A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF6CC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 21:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C722067D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 21:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CnpQSwh7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="as19LkQG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C722067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViZJDieseAkHC5PvxrtqMZKpGOarEmVVp3K7adC77Ws=; b=CnpQSwh7xeR5n9
	YEO3aiWXT0M1MdR1eCdQ6ga2LAaj4sYsC/I6t/ReeolJLDpsE2iXYLb5rcTGG/8nadz4XJ51MAySR
	Imfbu0zOTkUUd/RMbTUxRMCqhDhhuQdaQn5b8DHw7iZd6AGKN8bq2V3mKoIpFj6H4LuUdn/2NNHHL
	vt3Ui6Njclk0csE3Rfh8oyMsYSR6lfrqX6NZ6iHkWhHwWUCzkQ2ZFNtnnPeIHhN5KWvEezlgJovQf
	n93g9egekCFWLUoVEsHAlVuIwg2KTYBKZPk8HZdUSFXSNFYySd5D4osL8UvKWJa3MjDTgrDTfP+3D
	lLfwM3IUkzOYN3RvQ+IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1janf0-0004et-Sh; Mon, 18 May 2020 21:50:58 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1janey-0004df-8B
 for linux-snps-arc@lists.infradead.org; Mon, 18 May 2020 21:50:57 +0000
Received: by mail-oi1-x243.google.com with SMTP id b3so2536929oib.13
 for <linux-snps-arc@lists.infradead.org>; Mon, 18 May 2020 14:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=cLo/3kZFB2IfzldieQmVsBtxnHTKN/fTsEMRZOFcyOI=;
 b=as19LkQGmI1zSK7fYj9KVhS9fuRZVfHLqAlIiJjvGTDkzMAnCajfBsZ4i/S0I2c6TU
 pAqaKDQrDphIZAFQeFXtbqvIUgirEhUgXU9b8akx/rnVlyfM9zMgq/v0iLHVBD3FR/Gb
 Xp1D7sAGl4xjNwh9BzWihloHKaiWp8TFKkk9CRShgcc2MnpEoRtEENbKB1AZqJwkdUOL
 UMPGiiItiZ9SZSLdUQId8+vE38c663HlcQrfQCUbF/8+J+FNEIfUbfaFUDe3YopEVWgi
 UOUoyuy+iLPC5FpXZYDxR4nTcS+E8KFxKnBzAhYhtxcChlBqIMSSPIWDHRMRjABDIBk/
 tuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=cLo/3kZFB2IfzldieQmVsBtxnHTKN/fTsEMRZOFcyOI=;
 b=lcvs2Jh1urZdVqMNNATBoSYgsKlKsKr6yMnzwIqmUqGMQTGHnUb7k2NvuMGxMSRDVp
 ht6As3eWsAfoBQGJK7B/E2hyTN0A4cYrWo6prpYQCwvU5JRGq2XisYZbIHKr4/9t7mTL
 BDart33Aym3u0IX4xTJN/q9k+LzZc708mPGZ55OZHa/ar5SoBcBqZPwsiX78KQO5uk6p
 VsEy3ove0JdUKBfdURAvJjIEdZgPhqEpPIUp30Dgcdf7kWBEjC9K0pvvVT0/OKrkRgiY
 QdvMmSi0ZO/va7pYLpBEvztqe6wEnVHsfMxL2ZOweZQ+9l+IwdOEF4T1EGf9RInlX4MU
 KctA==
X-Gm-Message-State: AOAM532Hi/n9gGV3zWIaCN/rUMObcrtObBsxuBjUtd27R+as91Q2sVBr
 WhcHaL9F0c3ZO3hT+QP4chk=
X-Google-Smtp-Source: ABdhPJy74OqDNUQSrpRQwARHdjf+/FWfEuODWY1lKZ8v7yetEWdOzHSXk8czBw6+skJaN//6fJFziQ==
X-Received: by 2002:aca:7288:: with SMTP id p130mr1033975oic.15.1589838654537; 
 Mon, 18 May 2020 14:50:54 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id s198sm2933600oos.18.2020.05.18.14.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 14:50:53 -0700 (PDT)
Date: Mon, 18 May 2020 23:50:47 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Subject: Re: [PATCH] Kernel selftests: Add check if tpm devices are supported
Message-ID: <20200518215047.GA23583@dell5510>
References: <20200518213934.23156-1-Nikita.Sobolev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518213934.23156-1-Nikita.Sobolev@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_145056_312528_01FB544D 
X-CRM114-Status: GOOD (  11.30  )
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-kselftest@vger.kernel.org, Tadeusz Struk <tadeusz.struk@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joey Pabalinas <joeypabalinas@gmail.com>,
 linux-integrity@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Shuah Khan <shuah@kernel.org>, Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Nikita,

> tpm2 tests set uses /dev/tpm0 and /dev/tpmrm0 without check if they
> are available. In case, when these devices are not available test
> fails, but expected behaviour is test to be skipped.

> Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
Good catch.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> ---
>  tools/testing/selftests/tpm2/test_smoke.sh | 11 +++++++++--
>  tools/testing/selftests/tpm2/test_space.sh |  9 ++++++++-
>  2 files changed, 17 insertions(+), 3 deletions(-)

> diff --git a/tools/testing/selftests/tpm2/test_smoke.sh b/tools/testing/selftests/tpm2/test_smoke.sh
> index 8155c2ea7ccb..e55d3e400666 100755
> --- a/tools/testing/selftests/tpm2/test_smoke.sh
> +++ b/tools/testing/selftests/tpm2/test_smoke.sh
> @@ -1,8 +1,15 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

> -python -m unittest -v tpm2_tests.SmokeTest
> -python -m unittest -v tpm2_tests.AsyncTest
> +# Kselftest framework requirement - SKIP code is 4.
> +ksft_skip=4
I hope one day kselftest adds these constants into single file :).

> +
> +if [ -f /dev/tpm0 ] ; then
> +	python -m unittest -v tpm2_tests.SmokeTest
> +	python -m unittest -v tpm2_tests.AsyncTest
> +else
> +	exit $ksft_skip
> +fi

nit: instead of if/else, I'd use shorter form:
[ -f /dev/tpm0 ] || exit $ksft_skip

python -m unittest -v tpm2_tests.SmokeTest
python -m unittest -v tpm2_tests.AsyncTest

>  CLEAR_CMD=$(which tpm2_clear)
>  if [ -n $CLEAR_CMD ]; then
> diff --git a/tools/testing/selftests/tpm2/test_space.sh b/tools/testing/selftests/tpm2/test_space.sh
> index a6f5e346635e..180b469c53b4 100755
> --- a/tools/testing/selftests/tpm2/test_space.sh
> +++ b/tools/testing/selftests/tpm2/test_space.sh
> @@ -1,4 +1,11 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)

> -python -m unittest -v tpm2_tests.SpaceTest
> +# Kselftest framework requirement - SKIP code is 4.
> +ksft_skip=4
> +
> +if [ -f /dev/tpmrm0 ] ; then
same here.

> +	python -m unittest -v tpm2_tests.SpaceTest
> +else
> +	exit $ksft_skip
> +fi

Kind regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
