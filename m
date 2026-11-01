Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB57606A330
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhdXQI4Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=bAfiBn4/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YPYNbiub
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=NayNKE5CYJXuqpmOw+Kdw0KNu6KYY7zHys0yx/k+cjU=; b=dhdXQI4YSVxCV2T5DVpnhvyOX1
	N8Oh3mBD726zUg+HHqfSmwjqHHIrcbs3Azyofl2NV3jYhg10MNeSP/9HSGNeoCQsPLkuwS+3bMVzH
	hDQF+Uq/w5r+kpWuiVXr4BXP0KJI9pzKWq6FBRE801RWn3z+KqILJrEs3p0KDpkJbXXRWFAo+1UA5
	p3E8ZTZfBOb4TS/d7elPMhLW+dv+xhlDTjXwuwEP3wOoo/dBg+0pp+5gYYo5D+zCVgNb5e6hxNFx0
	3fiQQgh08B0eRDORoFmUtMldLSgWeEHyTgRJVTqkVkKHlvE4izrxghYKMs/+0kbC50NyfqSCk6w5l
	nly9AYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbVD-0000000EqDG-3zCY;
	Sun, 01 Nov 2026 19:46:03 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbVA-0000000EqCm-2X4Q
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Nov 2026 19:46:02 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0248B1400194
	for <linux-snps-arc@lists.infradead.org>; Sun,  1 Nov 2026 14:45:58 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 01 Nov 2026 14:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793562356;
	 x=1793648756; bh=XL5M91BSp4AAft2kzoFv3DfkIiGz5Ajg83L723WR2fE=; b=
	bAfiBn4/DIWkqkQUxxg3Tb6y6cbChQkhNKMFK2D+c36GSOmOwIaPPbVjyHkoUVxe
	cw5hEPANRwox8+VRg2f2eefII3zuGpi3hp0abQINTTvQe4vxQi5y1eU6rHRmKHIS
	KIr/1ztd/JTeAHPYVI6RLYmrHcN4yiG1ir3LTH/vS6k2YjyF8yFDWrzkP1YGlw5z
	gbTB8Rz5a9ppKzgkyH2thLCN2+A1BV2I7h6D2aZB5CoEQl3QJH7/aR+yyMr6aa0q
	GzmGAZkWympkTgEKSV5qhN99bp4fcSd8vAjc2pfKC9QG+Kv/5RfktQJGErRj+upN
	QgHgSpywnT34pW1MwS61rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793562356; x=
	1793648756; bh=XL5M91BSp4AAft2kzoFv3DfkIiGz5Ajg83L723WR2fE=; b=Y
	PYNbiubSn9MMP7KHrFPAFbQdJe4c633qAnayf25nYCPf1XFHu0du+xdRcUqj3snn
	T/O/9PiWYbcrQRLh+/e0+DAKW1RqMpNUl4D7Ki4ZhxPDfHl66qcJuvgeHR1h+qC5
	38SOO3PY9S7xYqsb+a1HMbpn3MR2o45WD9SQEcZE1rznMQGHOouUMOmuChZso0Xh
	qtBkDu/uih9L2BAdIrNiWH2d+LmkIEloth5M7dO0C/dDiAMPV8kjKSNcnwhFHppC
	hTg8X59vdkuM7atxM8js0NjwfkcyjMRxDelV7CHXIcVjxCywI1PpbQ+AjN/dqEOR
	83fiOpf+m3KwHffWHj3iA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793562356; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:d3X46J1Tvyw4gIlU/QAQ4qrkvAM1M4UBfX3K+nD3aCOQ9/C
	9QDdCFxnfe4s/87MJpumANg1RP1czrUFMyg0wt/YhI/Opz1uARO/ZpirOabsVjHO
	GZQVw59PT4rnlmocU7dfWZ0CLzFCagWup7g05KQPyYVjiDV19MN1g4Fe6X+rAE8M
	GAbQ3mmuAYH1WeFDSWEdn6u3fa+Li/U2xKT01n3JStq1/ItjW41SxdwpI4u0bhlt
	4GpvvXKi4fLkUa9askBoCpN944uEEq3HWqSQttDLCokC+S23gY60TlgWPZnO5VAF
	SRIqQzA11FS+SMq1F9K/hDOBHFHb+P5g/76LO7A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tVKU6x6Hpa8+j/X/xHhKxol+ZR0276eFx2r5IaeIxmo=:ZpJZa0RF5+QGwaEdzSO/cu72cdWSAvwHkZvNhEgoujY=;
X-ME-Sender: <xms:8ZbnakOYMSWEsemSaXapmHpnCu8zpieg9UREQTFgsISEI1EEmAcDRw>
    <xme:8ZbnalzaPLidekYo8i2rtkboUsFHjK1HMZs78tIHTpRFAWeG-1q2JnnM0Nup4bz88
    J7cJ7j4OqxJE0UEwdXCBLENyIyETJEm3jU2GRTjwP7w2F8UliBJo_33>
X-ME-Proxy-Cause: dmFkZTEU6JWhB3TLYMF5uFOSIuMrIcUT4lNAjQf/JM331pvv5qvR9X6bo/nK3gvmMufUr8
    ybDW9jtvmnTebXBKKdu54eJi4GQfSFqLaH367aaiCzgmaVkk5XA//fR0IiLK45NZGijfLS
    uoiIh9Db9QWnUcd3Q4a/JpTUzEHrccxJbjPp85ONjf7V1BrGYZ+MTvSP6YsAJRaldDWgcd
    AwroZy6sM1MSBdIsgagOAcgPNkU/c2OPjnl15tP0WqSdrESw/OYpdiMsZXzPqUdidI2wtn
    vNbhI9SqayT5bgxtEpTlIOCzgRp+ByStLKNVCBaaCD5nF0D7zLBLzak92KsoCPiYmjw2Es
    TPsptJo/RsTMuz2LgskRrlQaHduYmvylhsC7iyzw5Nx/7Is8kYL2HD0lR7zTM7fys/mm4e
    OctzPUlFL0uXC2wL7OCE+QAsajvIGQ5Z0LGbkZ+2KcanlpcLJ2iECD6DzpQIMNqa6yKHsy
    x3or2AOE1pSyYZLW3PzkkS51wH2bTLLK+G2kMng4mkrlKAYsQbJjZiLEY0RmhI3BL0E94i
    zGM9xdtGecwftNRzOIY6A8Ftp40QTNlbuADg2B46Y+TKL9A/gxqHwl6OAjWV2BIVM+c2yk
    gXtLhHdfAHvqlHUvFRy6JiZzrsPRTr2lBAo0N45K/KBmXpL8zrtTCjOHBYbg
X-ME-Proxy: <xmx:8pbnahowgsz2IBXOvVWPZYZqY3N-HSFfjxWXXtJ9QAmsp5Bl2ktqjQ>
    <xmx:8pbnaomMKvw67cfG-LK7uBWv0uNZ-WWSFTAQEA7ip8tYwtbdx04iHA>
    <xmx:8pbnaiccLXbUFszydGtXNuGom6OPXBdQwyDgy_IK1QnzAh58a1e5gw>
    <xmx:8pbnasq8FbDc4HFxbLBxfXTGL96aTU0bf5zt3rmL9pf4czWhiZ2QJw>
    <xmx:9JbnatMbgZ5ZcuUtu58AWpli_b72R8SkwkCwzLvsgC1rmzKbtMIHQ_C7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1557532A0093; Sun,  1 Nov 2026 14:45:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ap4PcZ20AeuN
Date: Sun, 01 Nov 2026 20:45:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, "Sasha Levin" <sashal@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: "Andrii Nakryiko" <andrii@kernel.org>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Message-Id: <ca697a3c-fee0-40a9-98e6-12e24febb3b7@app.fastmail.com>
In-Reply-To: <7de128f0-4f17-4a33-9a7a-14d5bbf62e64@kernel.org>
References: <20261015154044.4058618-1-sashal@kernel.org>
 <09db4d22-2836-4656-8c6a-a7e5377710fb@kernel.org>
 <8b4688ca-db5c-4122-b616-8e3964e403f8@app.fastmail.com>
 <7de128f0-4f17-4a33-9a7a-14d5bbf62e64@kernel.org>
Subject: Re: [PATCH] ARC: Strip libgcc debug information when generating BTF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_114601_081636_D38B0FA8 
X-CRM114-Status: GOOD (  14.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026, at 19:38, Vineet Gupta wrote:
> On 11/1/26 03:09, Arnd Bergmann wrote:
>>> I'm working on getting rid of libgcc linking for ARC.
>>
>> I hope there is some overlap with what you need for arc in the
>> lib/*.c functions. I can take both through the asm-generic tree
>> to reduce the dependencies if that helps.
>
> Oh that fits the bill perfectly. Mine also switched the others (with 
> build test using their cross tool-chains).
> Anyhow I'll wait for that to land. Would this need to wait full cycle ? 
> If it can land in 7.4-rcX, I can hold off my existing patches for 
> switching to current in-tree lib/* to also use the new ones and be done 
> with libgcc.

If you need this to fix the regression, I think it's fine to merge
the shared lib/*.c files for for 7.4 along with whatever you need on
top. I suspect though based on Sasha's patch, the only thing we
actually need is to stop exporting the floating point functions
so the types don't leak into btf. If you can verify that this
is the case, I would do the full conversion for both nios2
and arc in 7.5.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
