Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E4C61DBE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Aug 2026 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1f2Z1/Pw8QkSVwYpTU/ziIOKyIzWG6PU5ErnKH4X++Y=; b=KN4lYAV4HlogiJ4iEd7Ib1/uqU
	e7W4bIp8pxfd1vh20VbDzzJr9ahuvs7JkIWmi9A3CGJKmL6aGSfTX8ieFddP8zN28Wr7LfK9+PH2d
	+sw4woX7NF/OKGzvVi6GcF7/yAKJdGqziuZZpNWwBMJFlbMLgFi1WRKukc0Bx8IznQDGsZSEQvC6e
	JvFBRIaJkslZBdNor5KEe1xllZnGNAtmHqMbs5JkKd5aWJRA5+7DON3uXQsSFaYnZZdEDF+8ZFeqD
	Neyrew9twgLgU8hGQAlkb/6IIJreonvVGuGLVz1qG3Ymn1Ib3Avj99Kw5AIingxb/nChFGO5t+XRB
	FAe0DRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypuF-00000000jC5-1IC5;
	Tue, 25 Aug 2026 12:05:31 +0000
Received: from oss.cyber.gouv.fr ([51.159.188.251])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypuC-00000000jAg-05hF
	for linux-snps-arc@lists.infradead.org;
	Tue, 25 Aug 2026 12:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tVwDZmcOQ6Beqqvw2MUUnSWYeBXBUpNiZHyDjfWap2M=; b=L8/7kzH8Gya2x1BspNxnmPUFaK
	TlPI7PuFkipMsWw/eCqjOqpdzgVNePRM5sud31rqKZ7N3x4CXEAGYPG2vkw1oMZC7hky7utaryuKb
	J9Z3xJE/DxHHrnnV41PrBysVKiiHtzciciT2UgDF2raTvRPYFH9Z7Edqm6mRZ7CoXMHIH3pPOG+OD
	O9+J9otYoOYZt5gqeaQVPw0ocnsBJGdQiOjse3TGaJtGf7lF9mXEI/dDprsD8tag2bxRWbCOWK+hQ
	pHtVtKuO3FUhBQvZ+kveTVGQ60e2IbRMaReiyH99R0FFmjvleNavRPJFha8frwyFrft3bZqCCkQb6
	+fWTmImQ==;
Received: from [::1] (port=53682 helo=pf-012.whm.fr-par.scw.cloud)
	by pf-012.whm.fr-par.scw.cloud with esmtpa (Exim 4.99.5)
	(envelope-from <jeremy.jean@oss.cyber.gouv.fr>)
	id 1wyptV-0000000BqQk-47Kz;
	Tue, 25 Aug 2026 14:04:44 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 14:04:43 +0200
From: =?UTF-8?Q?J=C3=A9r=C3=A9my_Jean?= <jeremy.jean@oss.cyber.gouv.fr>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARC: check user addresses in unaligned access emulation
In-Reply-To: <0b3af924-6e87-484c-be0e-11279e28d77b@kernel.org>
References: <20260824203740.3689400-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <0b3af924-6e87-484c-be0e-11279e28d77b@kernel.org>
User-Agent: Roundcube Webmail/1.6.18
Message-ID: <1f91f8589126b98700ac0b215b0e72ff@oss.cyber.gouv.fr>
X-Sender: jeremy.jean@oss.cyber.gouv.fr
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: jeremy.jean@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: jeremy.jean@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_050528_211583_C0199C23 
X-CRM114-Status: UNSURE (   6.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpPbiAyMDI2LTA4LTI1IDA1OjAwLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4gSG93IGRv
IHlvdSBrbm93IHRoaXMgZm9yIHN1cmUuIERpZCB5b3UgcnVuIGludG8gdGhpcyBpc3N1ZSB5b3Vy
c2VsZiBhbmQgCj4gd2VyZSBhYmxlIHRvIHByb3ZlIHRoaXMgb3JkZXJpbmcuCj4gQW5kIGV2ZW4g
aWYgeW91IGZvdW5kIHNvbWUgZG9jdW1lbnRhdGlvbiBjYW4geW91IGNvbmZpcm0gdGhpcyB0byBi
ZSAKPiBoYXBwZW5pbmcgb24gcmVhbCBBUkM3MDAgaGFyZHdhcmUuCj4gSSd2ZSBiZWVuIG1haW50
YWluaW5nIEFSQyBmb3JldmVyIGFuZCBldmVuIGRvIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gCj4g
d29ya2luZyBBUkM3MDAgc2lsaWNvbi4KCkkgY2Fubm90IHNheSBJIGtub3cgdGhpcyBmb3Igc3Vy
ZSwgYW5kIEkgbmVpdGhlciBoYXZlIGFjY2VzcyB0byByZWFsIApoYXJkd2FyZSB0byBjaGVjayBm
dXJ0aGVyLgoKPiBJIGNhbiBzeW1wYXRoaXplIHdpdGggeW91ciBuZWVkIHRvIHNlbmQgYSBmaXgg
YW5kIGl0IG1pZ2h0IGFjdHVhbGx5IGJlIAo+IGNvcnJlY3QuCj4gQnV0IEkgY2FuJ3QgdGFrZSBh
IGZpeCB0aGF0IHRoZW9yZXRpY2FsbHkgZml4ZXMgc29tZXRoaW5nIHcvbyAKPiBkZW1vbnN0cmF0
aW5nIHdoYXQgcmVhbCBsaWZlIGNhc2UgaXQgY2F0ZXJzIHNvLgoKSSBoYXZlIG5vIG5lZWQgdG8g
c2VuZCBhbnl0aGluZzogSSdtIHNpbXBseSByYWlzaW5nIHRoaXMgcG90ZW50aWFsIApwcm9ibGVt
IHRvIHlvdSwgd2l0aCBhIHBvc3NpYmxlIGZpeCBhcyBoZWxwLgpJbiBteSB1bmRlcnN0YW5kaW5n
LCB0aGVzZSBsaXN0cyBhcmUgYXVkaXRlZCBieSBleHBlcnRzIGxpa2UgeW91IHRvIApjb25zaWRl
ciBwdWJsaWMgcmVwb3J0cyB0aGF0IG1heSBoYXZlIGNvbmNyZXRlIGltcGFjdC4KSSdtIHRvdGFs
bHkgZmluZSBpZiB0aGlzIGRvZXMgbm90IGZpdC4KClRoYW5rcyBmb3IgeW91ciB0aW1lLgoKUmVn
YXJkcywKSsOpcsOpbXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
