Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8B606A324
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Nov 2026 07:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G5UHNImR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=dKvu6EqV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=bSfWfPqd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fPP2peJplQu6OSVH5NCKI3htS3Pynh9cC+x6+H3dqTc=; b=G5UHNImRQNVt9+vHNyFQKvMIgT
	Tq2Sj7ru5Eo3NilbVYIBXwbwFliTSYkMJOwmMJCgtaCNwasAFaEFRRVUiMdp4BA/A5IyaS7rZ9Xe7
	PMGmTumEJzjRkA4YMxxJOh0JlyIF3/ePTn4Eolepe2gBSzF1TOl3G47iAOvYEMUwZaMUrdj9R34Sv
	EyInohXAJ23J/RT0cqt8NNp3HUol0IfQ5Eso0k4jGHZQHAzma/a0T9o0UooLkdOVXR7TBxnMV+Z0j
	bpKL+0cRQcdictgohhMA78IZT0EuxTi4S7cdw7SIqzfxsNuL5A9Qn4MiDLN5dateXJMxsjYeIhBax
	XLXl/mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmMu-0000000FjjX-3uVP;
	Mon, 02 Nov 2026 07:22:12 +0000
Received: from mta-64-143.flowmailer.net ([185.136.64.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmMr-0000000FjjB-2zZm
	for linux-snps-arc@lists.infradead.org;
	Mon, 02 Nov 2026 07:22:12 +0000
Received: by mta-64-143.flowmailer.net with ESMTPSA id 2026110207220482360996540019fd40
        for <linux-snps-arc@lists.infradead.org>;
        Mon, 02 Nov 2026 08:22:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=YxYTF91G0F1lBThpqealjixyREmPnBACasG4sOFttPk=;
 b=dKvu6EqVfSnsJbr1DYEMjQGKG08K0ycQRSmZDbjHQ0wmiEUVroiHDsR71k2L9GxtosNpUg
 hI4nCzr1GZkb9FBjoGy8fY2S/cVqwm1dVXhY9WTEx8yv2k9bofoHwExDt7TKt2953ZJI5FL8
 Q7Q1PmgD/16OV1B5H/u99P5C7fuZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=YxYTF91G0F1lBThpqealjixyREmPnBACasG4sOFttPk=;
 b=bSfWfPqdM+oB6qQiyE5obxHU0/LKsL5LXG9G41UDyAlpzS7u/vvcE99C+WwEvUYX1g2Vfk
 JDhEBHYxyLIS/S9DQo54lxUFFNPQwgCAVsD6ROrofTYoXqJ2nmGp77sEcRaZqgtY9RvojQ4B
 z8IuppUMQdHxD/brkp5OMHl0YYx+Js9sUuccqD0xalrkIDDleQJXazFTp8/QNPRHNIEF2+tA
 QGcuWhV/W/Aj8QTmPZLmN/MI1cZfUDU9lacTeO7AFx4muoDlDGVu+RjdXoAs5fUZqIUN+Xol
 W3tgoMpA1UZCrVeo3VSjMLIUYquAL6HCJ7mzRxwRHYrAuvblmFyJmkMQ==;
Date: Mon, 2 Nov 2026 08:22:02 +0100
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vineet Gupta <vgupta@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Ley Foon Tan <lftan@altera.com>,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH] nios2: ksyms: Declare __mulsi3 export
Message-ID: <20261102072202.hpcrob7xknqwx4a4@dev-vm-schuster>
References: <20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de>
 <47eb6b48-d664-440f-84b6-ba09f34d5e08@app.fastmail.com>
 <3175caa0-9f49-465d-959e-6b6c9bbb4f01@kernel.org>
 <e9f9ac85-442a-4bcc-8ec6-a03a6519178d@kernel.org>
 <cf2a83ea-5e5a-42c2-905b-199a43b6341a@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf2a83ea-5e5a-42c2-905b-199a43b6341a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_232210_407030_1A14B7D5 
X-CRM114-Status: GOOD (  17.62  )
X-Spam-Score: -3.0 (---)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMDEsIDIwMjYgYXQgMTI6MTk6MzRQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTdW4sIE5vdiAxLCAyMDI2LCBhdCAwMToyNiwgVmluZWV0IEd1cHRhIHdyb3Rl
Ogo+ID4gT24gMTAvMzEvMjYgMTY6NTcsIFZpbmVldCBHdXB0YSB3cm90ZToKPiAKPiA+Pgo+ID4+
IOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkAo+ID4+IOKUgsKgIHJv
dXRpbmXCoCDilIIgY2FsbHMg4pSCIGZ1bmN0aW9ucyDilIIKPiA+PiDilJzilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilKQKPiA+PiDilIIgX191ZGl2c2kzIOKUgiA0MTXCoCDC
oOKUgiAyMzjCoCDCoCDCoCDCoOKUggo+ID4+IOKUnOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUpAo+ID4+IOKUgiBfX3Vtb2RzaTMg4pSCIDIwM8KgIMKg4pSCIDEzMcKgIMKg
IMKgIMKg4pSCCj4gPj4g4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSk
Cj4gPj4g4pSCIF9fZGl2c2kzwqAg4pSCIDc3wqAgwqAg4pSCIDU3wqAgwqAgwqAgwqAg4pSCCj4g
Pj4g4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSkCj4gPj4g4pSCIF9f
bW9kc2kzwqAg4pSCIDQxwqAgwqAg4pSCIDMzwqAgwqAgwqAgwqAg4pSCCj4gPj4g4pSU4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCj4gPj4KPiA+PiBJIGNhbiB0YWtlIGEg
c3RhYiBhdCBwcm92aWRpbmcgdGhlIGdlbmVyaWMgbGliZ2NjIGltcGxlbWVudGF0aW9uIGluCj4g
Pj4gbGliLyogYnV0IEkgb25seSBleHBlY3QgdGhlIGFyY2hlcyB1c2luZyBsaWJnY2MgdmVyc2lv
biB0byBzd2l0Y2guCj4gPgo+ID4gSXQgc2VlbXMgdGhlcmUgNCBhcmUgYWx3YXlzIG5lZWRlZCB0
b2dldGhlciBvciBub3QgYXQgYWxsLgo+ID4gRG8gd2Ugd2FudCA0IEtjb25maWcgZ2F0ZXMgb3Ig
anVzdCBvbmUgd2lsbCBzdWZmaWNlID8KPiAKPiBFaXRoZXIgd2F5IGlzIGZpbmUgZm9yIG1lLiBT
aW1vbiBkaWQgc2VwYXJhdGUgc3ltYm9scyBpbiBoaXMKPiBuaW9zMiBwYXRjaFsxXSwgYW5kIEkg
ZG9uJ3QgbWluZCBzdGF5aW5nIHdpdGggdGhhdCB2ZXJzaW9uCj4gdW5sZXNzIHNvbWVvbmUgZWxz
ZSBmZWVscyBzdHJvbmdseSBhYm91dCBpdC4KClNvIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGVz
ZSBmb3VyIGluIHRoZSBzZXJpZXMgaXMgaW5kZWVkIGNvdXBsZWQgYW5kCmFsbCByZXNvbHZlIGJh
Y2sgdG8gYSBjb21tb24gYmFzZSBpbXBsZW1lbnRhdGlvbi4gSXQgZ290IHNlcGFyYXRlCnN5bWJv
bHMgYXMgSSBhc3N1bWVkIHRoYXQgb25lIGNvdWxkIHBvdGVudGlhbGx5IHByb3ZpZGUgb3B0aW1p
c2VkCmFzc2VtYmx5IHJvdXRpbmVzIGZvciBvbmUgb2YgdGhlbSBidXQgbm90IHRoZSBvdGhlcnMg
aW4gYW4gaW5kaXZpZHVhbAphcmNoOyBidXQgYWRtaXR0ZWRseSwgSSBkaWQgbm90IHRoaW5rIHRv
byBtdWNoIGFib3V0IHRoYXQgcG9pbnQgKG9uZQp3b3VsZCBpbmRlZWQgcHJvYmFibHkgcHJvdmlk
ZSBhIHNwZWNpYWxpc2VkIGluc3RhbmNlIG9mIHRoZSBjb21tb24gYmFzZQpyb3V0aW5lPykgYXMg
aXQgd2FzIGVhc3kgZW5vdWdoIHRvIGRvLgoKPiBJIHdvdWxkIGhvd2V2ZXIgbGlrZSB0byBoYXZl
IHNlcGFyYXRlIHBhdGNoZXMgdG8gYWRkIGxpYi9kaXZtdWwuYwo+IGFuZCBsaWIvbXVsc2kzLmMs
IGFuZCB0aGVuIHBhdGNoZXMgb24gdG9wIHRoYXQgc3RhcnQgdXNpbmcgdGhlc2UKPiBmcm9tIG5p
b3MyIGFuZCBhcmMuCgpJIGNhbiBzcGxpdCB1cCBQYXRjaCAzIGluIG15IHNlcmllcyBhbmQgcHVs
bCBvdXQgdGhlIG5pb3MyLUtDb25maWcKc2VsZWN0cyBvZiB0aGUgZ2VuZXJpYyBzeW1ib2xzLCBz
byB0aGF0IG5pb3MyIGVuYWJsaW5nIHRoZW0gaXMgYQpzZXBhcmF0ZSBwYXRjaC4KCkJlc3QgcmVn
YXJkcwpTaW1vbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
