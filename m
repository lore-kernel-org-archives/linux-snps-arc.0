Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658EF606A325
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NPdRviqw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EKEgsdW1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YfeVPFHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=EliJiw76PlXWDm1XbOze6nMCRn8SsyWyjI7XF0VqT3M=; b=NPdRviqwD04hqaFWmMSBbCoyTo
	um8PYG+XvnWwNve3StQvWFe3K+f5OW2aNypPatm3o/+6i+texdw9+BXxJxuBmxQTGdL16aZdCrvca
	F1YeEHAzlFLgPEvKHO14H/m8oftEclQrr0sqNJJpVa0I3H0mh4/RS/rvlMuH/nuq1M4aSXczo0O5A
	cYNsxcOu5g7dxXDurSs8Ok8l6qENkv8GqdhOY/B7f+w7km4Z519dNtuVdNE4Y1K1dhknv+hVv4w8V
	Yi2wGXp5TX3ojIUDF+GG6hFYq3xPnXXDUYi9trP9Jnb3TxCTF/jpTz62W0zCDgTuQ7nzM5r+T1LDL
	syr+ZMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTSP-0000000E87v-0G6Y;
	Sun, 01 Nov 2026 11:10:37 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTSL-0000000E85t-3MeU
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Nov 2026 11:10:35 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D8BA1400254
	for <linux-snps-arc@lists.infradead.org>; Sun,  1 Nov 2026 06:10:29 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 01 Nov 2026 06:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793531426;
	 x=1793617826; bh=4wfpv+QTFOtinTEPJMT8d2lisDokEK4BkxqjtCTUaKw=; b=
	EKEgsdW1SfyxgrDSqbPy62abe6+yBX+vL8a+2UTU1LI0NXk3+oTaS6avYxMslK0q
	hD3tRCq6YVfuB8k/7VCiSZEh8QwckekW94EGnruDIdvufsRWFDTepijIPuNrCzLV
	DVnQ3CMYpZuLAbHq5wf7HijEUnm1YbWV8SMIaVs+liNJT6U9WSi1i3G3Q5auBNIt
	e6w7QQDPuAyjHO83x7ztImfj0rBttm8KYodZ99NyC3Upd9h9hX8qzrQ+tebUqMir
	IMWjfaCAgAw3EN6uLyXuUVcTQE/+husMVqkdtUxz2+idrsk31Tr9MyMm8XFuVEWA
	d8lktoXhCdH1z8uqytMqHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793531426; x=
	1793617826; bh=4wfpv+QTFOtinTEPJMT8d2lisDokEK4BkxqjtCTUaKw=; b=Y
	feVPFHSXQ2Wa9yVx3P2SOgI7aWm+6qiGZoLObH40GRMXWrDCH/OP1fbDCqKQB8tM
	m5J6WHkhcOxWe2Grnv4SlUrdMekD9yY2ArzwI43YkiBpDpijgF42Lj3fb5kACDpj
	EaB94J+9Go38aF7zdzRbe+Gn+A1tKT1JBm5GvNBtjdVBeNkyRJJf+0e0wCE7x4em
	NWw/2RM8uztmwbHdJyVb6lSrddIPxSNDE4a99N7/hmOj81l2NVlEW+TOfZ/QM4zg
	JYRb+qER1rBvnOHHcypuE8Iufg5u21jWYORbdtvU6hVoYt+YorUQPt9vNHLOkG4P
	ipkEdAvx775JkdeMQOsoQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793531426; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:cxJC+KXFFzbHfwm//CUWZxUiDaQ0agoGAXbjXIf8TQCZMeY
	zH1SAZTGc8R6B3EXPU5Nw4/fJyc42wA4ltfGXxsh8i1Qo2AVXPxdgpjG9E/UfsvX
	12M4JsKouNsgPOV8DPKZrEy4pfP1r4lOL3nYBdGfoot4vIN2ERFdZkd4YQT/P1iA
	VQBiIk1xeuyMP1fetC4VYAUHClgnT5MLRmun/BZH9lsnYgKVpoQXf7RILaPaNy4n
	ZaaX4qGukOjjmJ+xchVkfd/jHp0SHEalnxGZ8HKpaCd5KUXVI9u5cGhUJmHD8wYL
	CCNNFfy2fyvTYvMeVOZBA394BWR4IIEauaLUjlw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FDA21DrBgrzqdaomdKVLZobssXJHwAfVxzSxQkSif5Y=:baVa2LtZmCenyZV/2WeRHNZ/OkEdZPERVqPYiPWE0pE=;
X-ME-Sender: <xms:Hx7narBXHcHcMiYGvSnv_DkH6BCsOwWvL-_K9ae1w0mN7mwySCRrQg>
    <xme:Hx7nasVJFejhn9XWQe2GeXmKbNk_wJH_bLzPzYji1RQPfqYMPpu9sx_7iKmpEB0uA
    HqK_nnOHZUNcCdwhnaGpLK4TBD7m2eeANcUJIGVf8SS8r5qKLLYLdo>
X-ME-Proxy-Cause: dmFkZTFysQRqxqvi0Wb9oWm4wruPAg1gWPeP99tcZEkNI3yxqU343EAQO2QcxMdNR8VWCi
    l6cZlJq2fU2vqsUmRqQmQqGu5Z5VFEOwmSomr6ENeL9mWh7UpbltslPJNnqEhkTmMvkXHo
    L4f4QMBZrIBi9bh0/DZ43DXc8eLec4y/7XkmT64KS3mY+3B/K4KBHcqKup+Bog3XZNARY4
    z/WkR56BmAlS35cY7G094YUf2tjFYccIb40rkzexho6b506uXU3NHCMJdvxV/m0KmPx2YT
    AW2ilBV6xD2RNKbgsUSEdIqOLvyVHuywb/hJ0+rptlsF7vHaqWv+g9ftHmTtcvmMGf0os8
    95oMGI5e3yW006P3n7JB5yMeQtWYhYHfUC6N6D78xwZKqWON129r5yp28eoY1Vd5KM9hQh
    T4PK8RjYQx+Oiacd7QceLJzWAqc65MLUu1Da90d5b4M+RcbFVhzLS8Npra/UzOzImA53Lr
    /kXqJWS7m2TOOjyzDOwB+/j2E4NqCLxGHszuz14N+gW/JcpjqzOiZUEqZsrv2sH+isWgAz
    e95+BKpxp1SJgdZvaDDtIbL0tlVSBYZbkN9EpcOoPK/Rp7svBFzv1tS7ckaHD+7bVvkrN+
    0DLxmvvVA4lQ+VPwns3W5ApBLAJkDOshDhlRJH+1VRecGtZ91j3c28m0b6Ew
X-ME-Proxy: <xmx:IB7nai-FL20ZyyPTM4c5Ty0swO0GPno4UDXOdsfQTK1txrjdz1Po5w>
    <xmx:IB7nanqkxMXV1851nhVBB3GfPGTdSsi3tBB10ytauak_45qcrl48Mg>
    <xmx:IB7nasTTd84biTLVWzJYJsjNndvQ5xzN2AR6lY19q8xLft5bZ5DwTw>
    <xmx:IB7naqP4mNORn8_XLi8QuJQVOJKda2ao13bmwWB5ENn5HWNoVqV6xw>
    <xmx:Ih7nagQrHVSJIoEpQ8YSiNcHvwobPTBrJlAH3bBifFFW3JuwThm5Tb-X>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E53DE32A009C; Sun,  1 Nov 2026 06:10:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ap4PcZ20AeuN
Date: Sun, 01 Nov 2026 12:09:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, "Sasha Levin" <sashal@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: "Andrii Nakryiko" <andrii@kernel.org>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Message-Id: <8b4688ca-db5c-4122-b616-8e3964e403f8@app.fastmail.com>
In-Reply-To: <09db4d22-2836-4656-8c6a-a7e5377710fb@kernel.org>
References: <20261015154044.4058618-1-sashal@kernel.org>
 <09db4d22-2836-4656-8c6a-a7e5377710fb@kernel.org>
Subject: Re: [PATCH] ARC: Strip libgcc debug information when generating BTF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_031034_422239_F3D7A7AF 
X-CRM114-Status: GOOD (  12.04  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026, at 02:04, Vineet Gupta wrote:
> On 10/15/26 08:40, Sasha Levin wrote:

>> diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
>> index 30158ae69fd4a..2807ee24f27e6 100644
>> --- a/arch/arc/lib/Makefile
>> +++ b/arch/arc/lib/Makefile
>> @@ -13,3 +13,11 @@ lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs-unaligned.o
>>   else
>>   lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
>>   endif
>> +
>> +# libgcc can contain complex floating-point debug types unsupported by BTF.
>> +# Strip only the debug information from a local copy of the selected archive.
>> +always-$(CONFIG_DEBUG_INFO_BTF) += libgcc.a
>> +OBJCOPYFLAGS_libgcc.a := --strip-debug
>> +
>> +$(obj)/libgcc.a: $(LIBGCC) FORCE
>> +	$(call if_changed,objcopy)
>
> I'm working on getting rid of libgcc linking for ARC.
> This requires adding some GENERIC_LIB_* routines, but as part of that 
> series I'll propose a revert of this and then the dropping the first link.
> Don't intend to revert this per se, but revert just makes it cleaner.

Have you seen Simon's series?

https://lore.kernel.org/all/20261030-nios2-remove-usage-of-libgcc-v1-3-4e341c66082e@siemens-energy.com/

I hope there is some overlap with what you need for arc in the
lib/*.c functions. I can take both through the asm-generic tree
to reduce the dependencies if that helps.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
