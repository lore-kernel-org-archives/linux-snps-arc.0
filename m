Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E55C54E67
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7niuYyoibetUjEpLqzflLbeFQ0rliwysLURE6UsVLUQ=; b=mUWmrFAOi1A3Sn
	fmMR+L0LyrPeos4EWkxtm50WsUjon6MrfBk4LIqsISGaPGv/C5FRKf4Lvb4iULkSBNputi+oeT9eM
	Aaha+eQRT6BxFsK/q/USQw+cDat/7RwR/R5mMhpQeked0Vlg5FKsS0VscdGVU7F+ulnJlLSUIc98R
	799O9t/jeXUPiVXnqdeNwF1sQD9rPqLCvi7OXzxjG4+dKBpqRdaDjcGR+D0x/9sVEJrabEMw5ortx
	cMMDikF56PjQe48PbvSY28vZAIoFGLD++zyRDBQnDkYJNM4Kb/X1wPBRLXZq/7LCeKXCs1FifUorq
	45yu8RpXPv6wrjIBkA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprF5-0000000EQqD-0OGU;
	Thu, 28 Mar 2024 15:00:35 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprF1-0000000EQkd-0zgE;
	Thu, 28 Mar 2024 15:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711637973; x=1712242773; i=deller@gmx.de;
	bh=YDPVzfrvCv+pzuXSEy32SACNexDWUcs4tGK+eCOtLyM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Wx3CBzYBHr9nc/IRrk2z31GjbumaJZ/bAeCu4XyCdbBU9LgVrXbM5+XVE4MK+Eni
	 ECldR0xODKA2jN8dW/Aou8jEzj8GdkC0NE1P7w9vRpx5MVIIEfXmfuBWMPJHcmuHC
	 U2FPSUmWWRFicjFyplPA4lu5eldSexmlLDznzqXSxXt8yhARHmtuPF+JmYIhxkJsD
	 wmkzWQcVHnqvh2gMgE22wVm/+OEDs87HS5o9sdV6TwHCLBJy6s5bRFDe6Avc6wf7S
	 KY+qaIG/fGQg8vhqEWHGNMe8gHs1RQ3p3xedh2r44boU7Rb865PHfMbnKel/Z5zXh
	 3FHelrpVAg0gw9421w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mof57-1se6Ht3RxR-00p0hR; Thu, 28
 Mar 2024 15:59:33 +0100
Message-ID: <2a017fe8-5261-4ad9-a958-85f147185e07@gmx.de>
Date: Thu, 28 Mar 2024 15:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arch: Remove struct fb_info from video helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
 javierm@redhat.com, sui.jingfeng@linux.dev
Cc: linux-arch@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-3-tzimmermann@suse.de>
 <b5a8bc60-ad16-407d-9e57-c224467c3f06@gmx.de>
 <9db306b2-b102-4bf5-a120-e1d279269fe9@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9db306b2-b102-4bf5-a120-e1d279269fe9@suse.de>
X-Provags-ID: V03:K1:7SWJg03mME+2vw8fb9mxmZKSJMDEo0mYJI2J/T0ImsQ5mhttnG0
 iBaFsAdrlSeIFpZ0cWgCd4uGlQYlXcUi5Zpcy3iAYz1i9QHGWtLhhZjLv9Z8Ir6J86LVacs
 +aQYyTrzgmYujTZODvUjFNl/NjPQnY2fRMy5lxrzpb922oh+DGwCAsIOL3IYfo3osCDms6X
 1BKDcYxw9teL2gTlonvnA==
UI-OutboundReport: notjunk:1;M01:P0:in3ib8DI/UQ=;kh/43hDUJpFePNUZFXuwCb/rS5P
 JVZy5WsGUNMASMfYITGnTfXwAZvBSre8fCLA2J/O9Ngw2Cwll7f/hr4EPqpMUpF2hxAC35mB5
 G0o9h78NFccWc2ws1B3AdrZu1rEYkNmbvCcS56DNZ5DuL3UZ6ITCynCyaTt3ov5bk0uYnCITB
 Mvehl1G3RNQ14AsbOmooCI+J0iOcfyw9C66+Et+qlTvNIW0GRjK32nj8mDAmPS9ACbtGe0Kvm
 zDX0ouKF5ojMIc+uUrloPg7D4YRfLzwVMhiDqzm2JtkeUMEe4WtbUzPMo3uiAEjYii/UZ3zPn
 65e72gFqvW4nq9lY3sagPOXNFFPrQaGWSHYqsXd8V2ixzeI3fNH3L2fvhaI9PDRVvi7znyToe
 5c8MbhTVNubRLjH+cNgUlXaDG2HznwhCWYSeZ5LPBSqSsDb41UQx+O9/6vYAI4E/GvObWZSCK
 bhaEACmJUbskma36CBnIHqR/EaysUI7QZCrJIZkFRzWpLYozhJKCzo8eXX/S/CkXeHo7CVQpu
 NxoLBKCn9d0vQN+ke9+yG/RFGY8cL5a8G+51OoMxOkZ2w5+Ss5WAD45Qx7Gur1Y/ZW2yVq5iz
 XcI5ggmsCUcFa77bh94EtF90IO8OWbdeXDxQvZU+N1uIBfbo/qbuHM6kmeoQa+EdjNDqalYOW
 XFxeXi6ieCII8Ate1L9ZJKDhkch5ZmCrOAyMRwELBctemqSgFY+xDZz388EZoj+800Sex6I8V
 prXBpkeMYRJfXCyhkdu23g986R2pWQOr2jthIQ+3HGlQJORhYv5zUSjqtYGHtbbaIomcDQj2y
 QZfDoRCjtYIGXEaBfiO1+mXRWAMicXr5tMFCqwXztkUUg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_080031_644531_41F70D1F 
X-CRM114-Status: GOOD (  16.00  )
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

T24gMy8yOC8yNCAxNDozMywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gQW0gMjguMDMuMjQg
dW0gMTI6MDQgc2NocmllYiBIZWxnZSBEZWxsZXI6Cj4+IE9uIDMvMjcvMjQgMjE6NDEsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOgo+Pj4gVGhlIHBlci1hcmNoaXRlY3R1cmUgdmlkZW8gaGVscGVy
cyBkbyBub3QgZGVwZW5kIG9uIHN0cnVjdCBmYl9pbmZvCj4+PiBvciBhbnl0aGluZyBlbHNlIGZy
b20gZmJkZXYuIFJlbW92ZSBpdCBmcm9tIHRoZSBpbnRlcmZhY2UgYW5kIHJlcGxhY2UKPj4+IGZi
X2lzX3ByaW1hcnlfZGV2aWNlKCkgd2l0aCB2aWRlb19pc19wcmltYXJ5X2RldmljZSgpLiBUaGUg
bmV3IGhlbHBlcgo+Pgo+PiBTaW5jZSB5b3UgcmVuYW1lIHRoaXMgZnVuY3Rpb24sIHdvdWxkbid0
IHNvbWV0aGluZyBzaW1pbGFyIHRvCj4+Cj4+IGRldmljZV9pc19wcmltYXJ5X2Rpc3BsYXkoKQo+
PiDCoMKgwqDCoG9yCj4+IGRldmljZV9pc19wcmltYXJ5X2NvbnNvbGUoKQo+PiDCoMKgwqDCoG9y
Cj4+IGlzX3ByaW1hcnlfZ3JhcGhpY3NfZGV2aWNlKCkKPj4gwqDCoMKgwqBvcgo+PiBpc19wcmlt
YXJ5X2Rpc3BsYXlfZGV2aWNlKCkKPj4KPj4gYmUgYSBiZXR0ZXIgbmFtZT8KPgo+IFRoZSB2aWRl
b18gcHJlZml4IGlzIHRoZXJlIHRvIHNpZ25hbCB0aGF0IHRoZSBjb2RlIGlzIHBhcnQgb2YgdGhl
IHZpZGVvIHN1YnN5c3RlbS4KPgo+IEJ1dCB0aGVyZSdzIHRvbyBtdWNoIGNvZGUgdGhhdCB0cmll
ZCB0byBmaWd1cmUgb3V0IGEgZGVmYXVsdCB2aWRlbwo+IGRldmljZS4gU28gSSBhY3R1YWxseSBo
YXZlIGRpZmZlcmVudCBwbGFucyBmb3IgdGhpcyBmdW5jdGlvbi4gSSdkCj4gbGlrZSB0byByZXBs
YWNlIGl0IHdpdGggYSBoZWxwZXIgdGhhdCByZXR1cm5zIHRoZSBkZWZhdWx0IGRldmljZQo+IGlu
c3RlYWQgb2YganVzdCB0ZXN0aW5nIGZvciBpdC4gU2FtcGxlIGNvZGUgZm9yIHg4NiBpcyBhbHJl
YWR5IGluCj4gdmdhYXJiLmMuIFsxXSBUaGUgZnVuY3Rpb24ncyBuYW1lIHdvdWxkIHRoZW4gYmUK
PiB2aWRlb19kZWZhdWx0X2RldmljZSgpIGFuZCByZXR1cm4gdGhlIGFwcHJvcHJpYXRlIHN0cnVj
dCBkZXZpY2UqLgo+IHZpZGVvX2lzX3ByaW1hcnkgZGV2aWNlKCkgd2lsbCBiZSByZW1vdmVkLiBU
aGlzIHJlbmFtZSBoZXJlIGlzIHRoZQo+IGVhc2llc3Qgc3RlcCB0b3dhcmRzIHRoZSBuZXcgaGVs
cGVyLiBPaz8KU291bmRzIG9rLgoKSGVsZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBz
LWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
