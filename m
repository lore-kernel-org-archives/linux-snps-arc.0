Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF69360A3801
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mb3UKsmm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2it1p1G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQ8OmacgBy0IWRBy3kXGctDZ8mVmwOGzqwnq0FIdMRY=; b=Mb3UKsmmXBMy3G
	RsS7hD4vzKV9/CZqyu49/mi8N7RXvoDZpF0Vu3+ujI59N4OORBFF2zypivYqpiAG/vp4rQz/1skjo
	Wa0rQNAESz8vm3hogIsSFSCLHVLwl3GdHQrTYiJbAknhDWN/Ni9Ex8+VRRlmajJd5yFURznfGkXhV
	yTIglap2SOCq5rm3l4b08uwKjelTz61sf/YhLgizSQ4aZAn4diRlOJVBkxiyfhlyPmtdMyVOTliuc
	ElCrRSDENvdAu33+gVDLoEQN3yA0I6CTbYWKPBapWn+e+PY+yTywP83n+5BnEtM8jK+AGGY27FPgK
	BTRtjN+IpanYzsTQ6QSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6L3-00000009KwS-1Q40;
	Tue, 20 Oct 2026 09:40:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Ky-00000009Ksr-1qd8
	for linux-snps-arc@lists.infradead.org;
	Tue, 20 Oct 2026 09:40:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so22597295e9.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 20 Oct 2026 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792489250; x=1793094050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
        b=a2it1p1GW9Dw6aFk64f4T6S3yjBYyDsgtJkZ34L4lyX4EWmsyh/V0MCDK0BrUrqr9V
         QAbjaDQj/PngP4Qsd/C0KB6fKe7KuDLfURUbi4+6r5b7xEVVv9talfgnOSFykaZBVYoM
         cMBOD6t4G+D6B+ZuV+URHHWGdSf2jLO+9nIwWx4SlIZI/77JMh1ytayHTdAypTyQxmaZ
         kFIc+VlpOwCoHBq/jEG0C9NTiEDbFf2CuQuO5qIoEjDC1d/nT3vbctX5mOkFaHyimpbq
         DCg49l/SYSG6V/eFlDCNl0K2FO9MWSB8TEWvl1Q2EGMv1/Ir3ABdqnUgjSsEeL+FpSim
         vPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489250; x=1793094050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A75WOahLsxv+hidbJl57jAQmkr4ntTiQuJfofCyvgAA=;
        b=JdYRG/WOlJzdjjqruDC4ubz9marzs926k+sU+rvMOeo6PtAAsjkpaASSgLAjwMaxfv
         QJU6qF6o+JQJuDEwJMhfEGmN5BRDSdp/bfZOKz1N63EFh6N6dFJ1Ohv47fo++LO85Tpc
         v4K6jUkVgzChn7p9pBHarA+Q5f5tDZ0ddnv+xyTFSjXYOtvy9TOwquPgIshl+kJ92xfn
         7wQ3Q0FH+nnzOGofbL0VQaJw2GvgsNaDtdodVVIVnTNXAteZxEglrfKPbOVZg2D0pLQb
         QCtU4gBmMew7DloT/hx3PqihfK8PLAG+Ar4LDtuTLODapm84zSBfxOZq9hHI50RloGFM
         8OOw==
X-Forwarded-Encrypted: i=1; AKwUvBybTpBb8I1t6k7vA+HWuqHqOUPFOv60PmxqRgXp1JTbfgaiTHOvg2DBJ4XABC6ybDJhkTwosIhXFgFVH/4awA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKIlc9LxMi4NWABPI9bRaVQtpyiWskQxbY5NG3F7zsWjwrX46Lu
	CNzUjYzzJAc8jsekSEMubdjyteuwdex7namm2ddg4stjFFCS65Ioypzi
X-Gm-Gg: AYBFou2+/1SH9/BlXtKqmTK3kKFTTG2/48r+EavT5C8K6hl8ElUeWW5807GeXqxTmiN
	YUpt0PfLEbahPBtYu/zTXZanpMCE5DMbrFZS+jAwM0Wqmb7iMtN8CuYySxhT9uH9QTznpca7rPV
	XHRHeZ6WC0dWJ1xmjDt8RIwdDCOlsZbX2oNowpCH+1rFm8T9s+vqEdqeDiaTpSmUgPvWL4QjAbp
	bgrM13Zfhuesx8sm7/jvA07WHZ1y55GeX5VTUFmg9CndbGmMiZauLKBtHjIPYbolUnz5UU8axL0
	dDpdysvEyBZWFuAGddBHQd9Uo5N6wJsMPzpe9ASSakFa61G01bSrIHEWMRss0C2lVruoxfiiXqM
	N0DThECPtE/4Ub+ru47inigLm+T/m69AEMorcjlrdDV+FNscX/gy3c3xMJehAJ0AgXFmUzMpR1o
	9LQAHhoHPqrPS6rFR0lMrNcL0T+XcFnxrBw9MiKHepanLujvz9MdlIJ/4xQgtez0I67gL4QaTRB
	mOkJfN9xkDXrwmzvKUVyXQvDPH/c0YhI28=
X-Received: by 2002:a05:600c:4e11:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a1d75f24b4mr211056285e9.9.1792489250061;
        Tue, 20 Oct 2026 02:40:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm64517275e9.13.2026.10.20.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:40:49 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:40:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, "schuster.simon@siemens-energy.com"
 <schuster.simon@siemens-energy.com>, Ley Foon Tan <lftan@altera.com>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
Message-ID: <20261020104048.7b038bdd@pumpkin>
In-Reply-To: <c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
	<47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
	<c32b7ed2-fa3f-4a58-9300-21efcc88f056@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024052_496845_0EE6AB7B 
X-CRM114-Status: GOOD (  21.16  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAxOSBPY3QgMjAyNiAwOTozNDo0MiAtMDUwMApEaW5oIE5ndXllbiA8ZGluZ3V5ZW5A
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIDEwLzE5LzI2IDA2OjE2LCBBcm5kIEJlcmdtYW5uIHdy
b3RlOgo+ID4gT24gTW9uLCBPY3QgMTksIDIwMjYsIGF0IDExOjQ5LCBUaG9tYXMgV2Vpw59zY2h1
aCB3cm90ZTogIAo+ID4+IEdDQyBtYXkgZW1pdCBsaWJjYWxscyB0byBfX211bHNpMygpLiBBcyBt
b2Rwb3N0IGlzIG5vdCBhd2FyZSB0aGF0IHRoaXMKPiA+PiBmdW5jdGlvbiBpcyBwcm92aWRlZCB0
aHJvdWdoIHRoZSBsaW5rZWQgaW4gbGliZ2NjLCBpdCBmYWlsczoKPiA+Pgo+ID4+IEVSUk9SOiBt
b2Rwb3N0OiBrZXJuZWwvbG9ja2luZy90ZXN0LXd3X211dGV4LmtvOiBzeW1ib2wgJ19fbXVsc2kz
JyB1bmRlZmluZWQhCj4gPj4gRVJST1I6IG1vZHBvc3Q6IGtlcm5lbC90aW1lL3Rlc3RfdWRlbGF5
LmtvOiBzeW1ib2wgJ19fbXVsc2kzJyB1bmRlZmluZWQhCj4gPj4gRVJST1I6IG1vZHBvc3Q6IGtl
cm5lbC9yZXNvdXJjZV9rdW5pdC5rbzogc3ltYm9sICdfX211bHNpMycgdW5kZWZpbmVkIQo+ID4+
IEVSUk9SOiBtb2Rwb3N0OiBmcy9mdXNlL3ZpcnRpb2ZzLmtvOiBzeW1ib2wgJ19fbXVsc2kzJyB1
bmRlZmluZWQhCj4gPj4gZXRjLgo+ID4+Cj4gPj4gTWFrZSBzdXJlIG1vZHBvc3QgY2FuIHNlZSB0
aGUgc3ltYm9sIGZyb20gbGliZ2NjLgo+ID4+Cj4gPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4+IENsb3NlczoKPiA+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYxMDE3MTkzMy5KNGJGT2ZMOC1sa3BAaW50ZWwuY29t
Lwo+ID4+IEZpeGVzOiAyZmM4NDgzZmRjZGUgKCJuaW9zMjogQnVpbGQgaW5mcmFzdHJ1Y3R1cmUi
KQo+ID4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPiAgCj4gPiAKPiA+IEFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPgo+ID4gCj4gPiBUaGUgcGF0Y2ggbG9va3MgY29ycmVjdCB0byBtZSwgYnV0IGl0
IHdvdWxkIGFsc28gYmUgbmljZSB0byBub3QgdXNlCj4gPiBsaWJnY2MgYXQgYWxsLiBXaGF0IEkg
c2VlIGlzIHRoYXQgb25seSBhcmMsIG5pb3MyLCBvcGVucmlzYyBhbmQKPiA+IHBhcmlzYyBzdGls
bCBsaW5rIGFnYWluc3QgdGhlIHRvb2xjaGFpbi1wcm92aWRlZCBsaWJnY2MsIGV2ZXJ5dGhpbmcK
PiA+IGVsc2UgdXNlcyB0aGUga2VybmVsJ3Mgb3duIHJ1bnRpbWUuCj4gPiAKPiA+IEl0J3MgcHJv
YmFibHkgbm90IGV2ZW4gdGhhdCBoYXJkIHRvIGRvIHJpZ2h0LCBoZXJlIGlzIHdoYXQgSSBmb3Vu
ZAo+ID4gaXMgaW1wb3J0ZWQgZnJvbSBsaWJnY2MuCj4gPiAgIAo+IFBhdGNoIGFwcGxpZWQhCj4g
Cj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiBBcm5kLCBJJ2xsIHdvcmsgdG8gb24gdGhlIE5J
T1MyLgoKRG9lcyB0aGUga2VybmVsIHN1cHBvcnQgbmlvczIgdGhhdCBkb24ndCBoYXZlIHRoZSBv
cHRpb25hbCBtdWx0aXBseQppbnN0cnVjdGlvbnM/IChpbmNsdWRpbmcgdGhlIG9uZXMgdGhhdCBn
ZW5lcmF0ZSB0aGUgaGlnaCAzMiBiaXRzKS4KCklmIHRoZSBjb21waWxlciBrbm93cyB0aGV5IGV4
aXN0IChpdCBpc24ndCB0aGUgZGVmYXVsdCkgdGhlbiBpdCBzaG91bGQKanVzdCB1c2UgdGhlbS4K
VGhlIGZwZ2EgYWxtb3N0IGNlcnRhaW5seSBoYXZlIHBsZW50eSBvZiAxOHgxOCBEU1AgbXVsdGlw
bGllciBibG9ja3MKdGhhbiBjYW4gYmUgdXNlZCAtIHNvIHRoZSByZXNvdXJjZXMgYXJlIHRoZXJl
LgooVGhlIHNsb3cgcGFydCBvZiB0aGUgbXVsdGlwbHkgaXMgYWN0dWFsbHkgdGhlIHJpcHBsZSBh
ZGRlciB0aGF0CmdlbmVyYXRlcyB0aGUgaGlnaCA0NiBiaXRzLikKCkRhdmlkIAoKPiAKPiBEaW5o
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
