Return-Path: <SRS0=+CZ8=KN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46788C433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 May 2021 06:39:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B496961261
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 May 2021 06:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B496961261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=exvqIFJRJqQGQF7IAG1PvTsE03kGaEJQzQyXCwXP6pE=; b=Bizr8JQDIZnu0x9Qm8xc9iCjk
	nn1cHf9u8+S2b/AiO2+cR9+AZrUEr7qgmV8apnFKpiW8PnqKuWLqjbz/RSGtYHHjzL64gp6hWESGD
	848D0hl9ttQVcR7D09wB2ZowlBFcBuUXjGri96Cy3IGRnOCbULDYIWV/c9iHwgy1iRAqynvmQlVOD
	K9XRaTbpr50uTRQsjFs+EmbNxrdAlPUhabTbxXSqGWhnJKILGAxgfKv8gej6ZR6a6ZwZSgIJjYeeR
	ANPS84Ji5IWzgfxHgOSdEXzMcnG9N1OtrhjPjozHPWCdzD3D6Zxba+CNwES3U/fCAfzCO+JSMg6xb
	kTs/yABvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1litNv-00HB1G-6t; Tue, 18 May 2021 06:39:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1litNs-00HB0M-GC
 for linux-snps-arc@desiato.infradead.org; Tue, 18 May 2021 06:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=j46ZBJOvoSRu/Yc9BA17cCKPJd6PhXqxBZCpjWHURiM=; b=m00bXaoP1Utc3D+hFnvOW/rLdf
 HBV6K3ne1hFbC9zRb0zO7UJsEkDGYdkYldXVkMq17n2HQnATfek70iV1x5QCG27dhyWBaCQlCNffI
 WQQo3xk/WQNee6UFMQsdQ3ZUi5xjsuhfpu40u4u+oOFMdQrwuev3Y3Ab7RxXq47IXgbLRHq4jsbGo
 hZsx8wRsmK3eJRLWqc/fhcNltXx5Kn6vqH9atPdSDo2DlEK4MH1ZCwEohGWXy/6yWFQMO1fUxrrHB
 W6mSOHIPPraez/XVVvfk5AF6K2kpQ0HHQFKi4Nx32ekwfzHG2VjuQQguW0Pgda4N9xFneu4JFaS9J
 hQ9qlwfg==;
Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1litNp-00EMHD-E1
 for linux-snps-arc@lists.infradead.org; Tue, 18 May 2021 06:39:15 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1caa:dc3:ec0a:c9c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3821F13F899;
 Tue, 18 May 2021 08:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1621319950;
 bh=bHu2k2Tflg3g+OgIpgNbSsyFYXv6jNhHOuAMg0KpoHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tlUo8ZfuOpbMDo+c+/oXzC6DWZlEIYb9O+QgPnviaG29zqgasnOvdI8/EVgHPxrwZ
 tlk70YySb46PlsK9Ky8AwNIkjZ6QWR4YM0kpcKKpIh8x9svs8g/jz49mjdmj7HFEnm
 zFRSYbsUXRYvhS0N0vZSSIa6Qmqe/QJeeymyD/c5LNuU7Z/8Ro8ricmJOeCeo7bEPQ
 xMfM8DEkuATzjHZD3q/1p4Zugf55wRqTcljjf1USSSTkolptTzMUPlWX3WGV8p0Qqv
 KF5XQv2Mqw/aXtyn/sWsgDSiC5nLy7ya1bEm00qHG6dTuPsB1E8+rnEUK8ftpmPdMR
 09cTZ5CRSVsyw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 18 May 2021 08:38:59 +0200
Date: Tue, 18 May 2021 08:38:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [Buildroot] [PATCH v3 2/4] lmbench: memsize: increase delay for
 slow FPGAs
Message-ID: <20210518063859.GJ2506@scaer>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-4-vgupta@synopsys.com>
 <20210517200906.GE2506@scaer>
 <0c486431-d2fb-d7e7-0c35-9d419b31b48a@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c486431-d2fb-d7e7-0c35-9d419b31b48a@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_233913_642604_3C346864 
X-CRM114-Status: GOOD (  14.18  )
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

dmluZWV0LCBBbGwsCgpPbiAyMDIxLTA1LTE3IDIxOjUzICswMDAwLCBWaW5lZXQgR3VwdGEgc3Bh
a2UgdGh1c2x5Ogo+IE9uIDUvMTcvMjEgMTowOSBQTSwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiA+
Cj4gPj4gT0sKPiA+PiAtLS0KPiA+IFRoaXMgdHJpcGxlLWRhc2ggbGluZSBpcyB0aGUgdXN1YWwg
Z2l0IG1hcmtlciB0byBlbmQgdGhlIGFjdHVhbCBjb21taXQKPiA+IGxvZywgc28gZXZlcnl0aGlu
ZyBiZWxvdyB3YXMgZHJvcHBlZCB3aGVuIGFwcGx5aW5nIHRoZSBwYXRjaCB3aXRoIGdpdC1hbS4K
PiA+IEkndmUgZml4ZWQgdGhhdCwgYW5kIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gWWVw
IEknbSBhd2FyZSBvZiB0aGF0IGFuZCBzb3JyeSAtIHRoZXJlJ3Mgbm8gZWFzeSB3YXkgdG8gInVu
ZGVybGluZSIgCj4gc3R1ZmYgaW4gYSBwYXRjaCA6LSkKCk9oIHllcywgdGhlcmUgX2lzXy4gOy0p
Cgo+ID4gSG93ZXZlciwgSSB3b25kZXIgaG93IHJlbGV2YW50IGxtYmVuY2ggaXMgbm93YWRheXMu
IEluZGVlZCwgdGhlcmUgaGFzCj4gPiBiZWVuIHplcm8gYWN0aXZpdHkgb24gbG1iZW5jaCBzb3Vy
Y2UgY29kZSBzaW5jZSBKdW5lIDIwMDksIGFsbW9zdCAxMgo+ID4geWVhcnMgYWdvIG5vdy4uLgo+
IERlcGVuZHMgb24gd2hvIHlvdSBhc2suIEkgdGhpbmsgaXQgaXMgc3RpbGwgcmVsZXZhbnQgZm9y
IGVtYmVkZGVkIAo+IHBsYXRmb3Jtcy7CoCBFc3BlY2lhbGx5IHdoZW4gZG9pbmcgbmV3IENQVSBh
bmQvb3IgSVNBIGJyaW5ndXAgLSBmb3JtZXIgd2UgCj4gdGVuZCB0byBkbyByZWd1bGFybHkgYXQg
U3lub3BzeXMgaXQgZ2l2ZXMgeW91IGEgZ3JlYXQgInNuYXBzaG90IiBvZiAKPiBwZXJmb3JtYW5j
ZSBvZiAyIHN5c3RlbXM6IG9sZCBhbmQgbmV3LiBBbmQgdGhpcyBpcyB0cnVlIHN0YXJ0aW5nIGZy
b20gCj4gZm9yay9zaGVsbCBsYXRlbmN5IHRvIG1lbW9yeSBsYXRlbmN5IGFuZCBiYW5kd2lkdGgg
dGVzdHMgd2hpY2ggYXJlIHN0aWxsIAo+IHByZXR0eSBzbWFydCBmb3Igc29tZXRoaW5nIHdyaXR0
ZW4gc28gbG9uZyBhZ28uCgpBaCwgeWVzLCB0aGF0IG1ha2VzIHNlbnNlLCBpbmRlZWQuCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBz
LWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
