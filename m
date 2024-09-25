Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7917C369AA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Sep 2024 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:To:Subject:
	Message-ID:From:Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaUlkwcxThwupw7syhZgq1sdfga/gn+/lmsKxulR40Q=; b=yE1EO8r94iSmiX
	pAAPG3QIEqx3Pyd4mS1mXeKNXEhDyoqAa4F19OtICT5J8x55mIS/ybKl4eXhAkhy2IrAAZB36327B
	TU9o1A4w3YJi3d0wtEDgQjVHKXxe3HsH5KRcHQLgLp7vaIM1odPuVgevrdH8gOZPIkIeyTrQzCXED
	PsJI5KgJl0QSZciGNa4Tvy2kl9Dgrx6kqTBbKYzm/m1geGqiU2B5A1zXVLXrkgPkC6jJlCmPxAjHN
	IC60FXl7cOvZrtUSA28fNlzdPKdG8gXQ1jBxZOQEDj/3J2XLGNhid2g7zOFaYpKG+5Gl039b5tmH0
	j0zkCfQvW0BWpB+YER3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stNhG-00000004XTu-0oJd;
	Wed, 25 Sep 2024 08:48:30 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stNhC-00000004XRj-0e80
	for linux-snps-arc@lists.infradead.org;
	Wed, 25 Sep 2024 08:48:28 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1727254095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNGn5ulGgTdgKL6Yr3YCi7cBfJIpzPGdWRjltBCxkU8=;
	b=JC6Wnxc8g9qUns/WSsO0Y/b4vTWb9D+gE3Wqy7xU0Aef82QhGnhq8P4iRCOQXnntLnd1MT
	kXo14Uon97J2vcHSt8V2wK4bmltvZMfhqbHSMHvk0CmvZJ2mJU3xijGHHOzP0jaBUXO4+o
	Ah+WIzdMIDmBhP6Dyp/WwviOWMh/9IB5JQGDZ84vdp5WIy7lbLZDPi8/OOTQcNu8hOhMF3
	eqfSBlYFrgWYwVsFsQMpLznzVdXyGfno4PPbOz1FuVSRNPx2C1PeiSxXdpmpTezRHabNux
	3/8dBwwZNam+ineilASr/naAB7T13fa9viTClGiPc2kwtuhseyHA2ryBKAQEfw==
Date: Wed, 25 Sep 2024 08:48:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Shahab Vahedi" <list+bpf@vahedi.org>
Message-ID: <397dbb19cf2e951a4d24772ca26c836d682e69bf@vahedi.org>
TLS-Required: No
Subject: Re: [PATCH] arc: rename aux.h to arc_aux.h
To: "=?utf-8?B?U3rFkWtlIEJlbmphbWlu?=" <egyszeregy@freemail.hu>,
 linux-snps-arc@lists.infradead.org, list+bpf@vahedi.org, "Vineet Gupta"
 <vineet.gupta@linux.dev>, abrodkin@synopsys.com
In-Reply-To: <2d28065c-1536-44f1-9132-3d6922c09ca2@freemail.hu>
References: <2d28065c-1536-44f1-9132-3d6922c09ca2@freemail.hu>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_014826_769707_649858AF 
X-CRM114-Status: UNSURE (   4.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

K0FkZCBWaW5lZXQgKHdpdGggdGhlIHJpZ2h0IGFkZHJlc3MpCitVcGRhdGUgQWxleGV5J3MgYWRk
cmVzcyB0byBidXNpbmVzcyBpbnN0YW5jZQoKU2VwdGVtYmVyIDIzLCAiU3rFkWtlIEJlbmphbWlu
IiB3cm90ZToKCj4gTG9uZyB0aW1lIGFnbyBpIHN1Ym1pdHRlZCBhIHBhdGNoLCB3aGVuIGl0IHdp
bGwgYmUgcmV2aWV3ZWQ/IElzIHRoZXJlIGFueSBhY3Rpdml0aWVzIGhlcmUgaW4gdGhlIHN5bm9w
c3lzL0FSQyBrZXJuZWwgbGlzdD8KPiAKPiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
c25wcy1hcmMvMjAyNDA1MjAxNDI2NDcuNzA0NDAtMS1lZ3lzemVyZWd5QGZyZWVtYWlsLmh1L1Qv
I3UKPiAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWFyYy9wYXRj
aC8yMDI0MDUyMDE0MjY0Ny43MDQ0MC0xLWVneXN6ZXJlZ3lAZnJlZW1haWwuaHUvCgpUaGV5IGxv
b2sgZ29vZCB0byBtZS4gVGhhbmsgeW91IFN6xZFrZSEKClJldmlld2VkLWJ5OiBTaGFoYWIgVmFo
ZWRpIDxsaXN0K2JwZkB2YWhlZGkub3JnPgoKQ2hlZXJzLApTaGFoYWIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
