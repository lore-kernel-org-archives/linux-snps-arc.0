Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0730FF8868
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2026 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADxRv3O2Z5Rl0mWxDjeDqPOioJPRDU75nQHTSI/YDI0=; b=AsfxS8vdpLiscJ
	bUSoTC9/Lagom0v27Cf4FK4BR4BlPlHoefRvSzGVWpPjaMYhMC4t0RvI7qPISc59Jc8pHgFKNV4xH
	dPNAg/YRw5CvP7Ct4aXSWYNotytctjWB/ZqL3FUPwInvoxcZPW0ORVufNObXZ6WZcScaH1Be15CDy
	WTd41TGu4hYeAykfAsKVo8WRBEYzQbH4bUwXnpQCVI12KkmaPD4Vnwa4Nls44UEuMVWOBJRH6IqRB
	FFpx22CTMUvGTHkWeOX8Srned38yKHdlR6vSMASQoS1sG1Oy+pj9jxIfgnq/93sLVCdFp/0TgB/R2
	wAjHv8QG8BLFiDCgHhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQaF-0000000HZKH-1Jk8;
	Mon, 27 Apr 2026 18:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQaC-0000000HZJc-0L84;
	Mon, 27 Apr 2026 18:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46E9540246;
	Mon, 27 Apr 2026 18:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCCFC2BCB5;
	Mon, 27 Apr 2026 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777314053;
	bh=fSfdZ5/fBIJBn92+lTQ8RknrFiSruKk4Zm5FPbyuhQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2scZpbKenpOejPaCkxdr8Fr6c4RornKyxLjF0dKFYhSlw+matCdj3SDWlLeqEo9E
	 a373XI9Iold2YwxLkAFI1OVkbxbR9JLgxu/comiCZJeBJjQK8IiPFbF3a0OQIu5zFJ
	 z32D8XDVz5Fo00XfpR09lc3WO+fPx7ont3FOA+TL4jxGM7w1J5Z2cHWcv2Vi05coRU
	 6lIPjD/Eh4XtMiOh4PUlJfQ+hbcnF50oIaF0Y5is14Jb9Uy7pNbq6e4WVWxwPn3QZF
	 F5175xYuXBtUSK+HvgeuPZTDTXog5e6524IUP62vgqpWl/U/vR5Pqvo+DbOYeGkne+
	 cSOzK+yVIhXWw==
Message-ID: <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org>
Date: Mon, 27 Apr 2026 20:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-x25@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-arch@vger.kernel.org
References: <cover.1777306795.git.chleroy@kernel.org>
 <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <ae-j2_QirCySZD02@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_112124_188243_5F384290 
X-CRM114-Status: GOOD (  15.37  )
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

CgpMZSAyNy8wNC8yMDI2IMOgIDE5OjU4LCBZdXJ5IE5vcm92IGEgw6ljcml0wqA6Cj4gT24gTW9u
LCBBcHIgMjcsIDIwMjYgYXQgMDc6MTM6NDhQTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJveSAoQ1Mg
R1JPVVApIHdyb3RlOgo+PiBBdCB0aGUgdGltZSBiZWluZywgeDg2IGFuZCBhcm02NCBhcmUgbWlz
c2luZyB1bnNhZmVfY29weV9mcm9tX3VzZXIoKS4KPiAKPiBObywgdGhleSBkb24ndC4gVGhleSAo
c2hvdWxkKSByZWx5IG9uIGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBmcm9tCj4gbGludXgvdWFj
Y2Vzcy5oLCBsaWtlIGV2ZXJ5IG90aGVyIGFyY2gsIGV4Y2VwdCBmb3IgIFBQQyBhbmQgUklTQ1Yu
Cj4gCj4gQnV0IHRoZXkgI2RlZmluZSBhcmNoX3Vuc2FmZV9nZXRfdXNlciwgYW5kIHRoZSB1bnNh
ZmVfY29weV9mcm9tX3VzZXIoKQo+IGJlY29tZXMgdW5kZWZpbmVkIGNvbmRpdGlvbmFsbHkgb24g
dGhhdC4KPiAKPiBTbyBwbGVhc2UsIGZpeCB0aGF0IGJ1ZyBpbnN0ZWFkIG9mIGludHJvZHVjaW5n
IGFub3RoZXIgYXJjaCBmbGF2b3IuCj4gV2UnZCBhbHdheXMgY2hvb3NlIGdlbmVyaWMgdmVyc2lv
biwgdW5sZXNzIHRoZXJlJ3Mgc3Ryb25nIGV2aWRlbmNlCj4gdGhhdCBhcmNoIG9uZSBpcyBiZXR0
ZXIuCgpCdXQgdGhleSBib3RoIGltcGxlbWVudCB0aGUgZXhhY3Qgc2FtZSB1bnNhZmVfY29weV90
b191c2VyKCkuIFdoYXQgaXMgCnRoZSBkaWZmZXJlbmNlIGhlcmUgPwoKU2hvdWxkIHRoYXQgZnVu
Y3Rpb24gYmVjb21lIGdlbmVyaWMgdG9vID8KCkNocmlzdG9waGUKCj4gCj4gCj4gVGhhbmtzLAo+
IFl1cnkKPiAgIAo+PiBBZGQgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgKENTIEdST1VQKSA8Y2hsZXJveUBrZXJuZWwub3JnPgo+PiAtLS0KPj4gICBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS91YWNjZXNzLmggfCAyOSArKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4+IGluZGV4IDNhMGRkM2MyYjIzMy4uMTBjNDU4ZmZhMzk5
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPj4gKysrIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4+IEBAIC01OTgsNyArNTk4LDcgQEAgX2xh
YmVsOgkJCQkJCQkJCVwKPj4gICAgKiBXZSB3YW50IHRoZSB1bnNhZmUgYWNjZXNzb3JzIHRvIGFs
d2F5cyBiZSBpbmxpbmVkIGFuZCB1c2UKPj4gICAgKiB0aGUgZXJyb3IgbGFiZWxzIC0gdGh1cyB0
aGUgbWFjcm8gZ2FtZXMuCj4+ICAgICovCj4+IC0jZGVmaW5lIHVuc2FmZV9jb3B5X2xvb3AoZHN0
LCBzcmMsIGxlbiwgdHlwZSwgbGFiZWwpCQkJCVwKPj4gKyNkZWZpbmUgdW5zYWZlX3B1dF9sb29w
KGRzdCwgc3JjLCBsZW4sIHR5cGUsIGxhYmVsKQkJCQlcCj4+ICAgCXdoaWxlIChsZW4gPj0gc2l6
ZW9mKHR5cGUpKSB7CQkJCQkJXAo+PiAgIAkJdW5zYWZlX3B1dF91c2VyKCoodHlwZSAqKShzcmMp
LCh0eXBlIF9fdXNlciAqKShkc3QpLGxhYmVsKTsJXAo+PiAgIAkJZHN0ICs9IHNpemVvZih0eXBl
KTsJCQkJCQlcCj4+IEBAIC02MTEsMTAgKzYxMSwyOSBAQCBkbyB7CQkJCQkJCQkJXAo+PiAgIAlj
aGFyIF9fdXNlciAqX191Y3VfZHN0ID0gKF9kc3QpOwkJCQlcCj4+ICAgCWNvbnN0IGNoYXIgKl9f
dWN1X3NyYyA9IChfc3JjKTsJCQkJCVwKPj4gICAJc2l6ZV90IF9fdWN1X2xlbiA9IChfbGVuKTsJ
CQkJCVwKPj4gLQl1bnNhZmVfY29weV9sb29wKF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3VjdV9s
ZW4sIHU2NCwgbGFiZWwpOwlcCj4+IC0JdW5zYWZlX2NvcHlfbG9vcChfX3VjdV9kc3QsIF9fdWN1
X3NyYywgX191Y3VfbGVuLCB1MzIsIGxhYmVsKTsJXAo+PiAtCXVuc2FmZV9jb3B5X2xvb3AoX191
Y3VfZHN0LCBfX3VjdV9zcmMsIF9fdWN1X2xlbiwgdTE2LCBsYWJlbCk7CVwKPj4gLQl1bnNhZmVf
Y29weV9sb29wKF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3VjdV9sZW4sIHU4LCBsYWJlbCk7CVwK
Pj4gKwl1bnNhZmVfcHV0X2xvb3AoX191Y3VfZHN0LCBfX3VjdV9zcmMsIF9fdWN1X2xlbiwgdTY0
LCBsYWJlbCk7CVwKPj4gKwl1bnNhZmVfcHV0X2xvb3AoX191Y3VfZHN0LCBfX3VjdV9zcmMsIF9f
dWN1X2xlbiwgdTMyLCBsYWJlbCk7CVwKPj4gKwl1bnNhZmVfcHV0X2xvb3AoX191Y3VfZHN0LCBf
X3VjdV9zcmMsIF9fdWN1X2xlbiwgdTE2LCBsYWJlbCk7CVwKPj4gKwl1bnNhZmVfcHV0X2xvb3Ao
X191Y3VfZHN0LCBfX3VjdV9zcmMsIF9fdWN1X2xlbiwgdTgsIGxhYmVsKTsJXAo+PiArfSB3aGls
ZSAoMCkKPj4gKwo+PiArI2RlZmluZSB1bnNhZmVfZ2V0X2xvb3AoZHN0LCBzcmMsIGxlbiwgdHlw
ZSwgbGFiZWwpCQkJCVwKPj4gKwl3aGlsZSAobGVuID49IHNpemVvZih0eXBlKSkgewkJCQkJCVwK
Pj4gKwkJdW5zYWZlX2dldF91c2VyKCoodHlwZSBfX3VzZXIgKikoc3JjKSwodHlwZSAqKShkc3Qp
LGxhYmVsKTsJXAo+PiArCQlkc3QgKz0gc2l6ZW9mKHR5cGUpOwkJCQkJCVwKPj4gKwkJc3JjICs9
IHNpemVvZih0eXBlKTsJCQkJCQlcCj4+ICsJCWxlbiAtPSBzaXplb2YodHlwZSk7CQkJCQkJXAo+
PiArCX0KPj4gKwo+PiArI2RlZmluZSB1bnNhZmVfY29weV9mcm9tX3VzZXIoX2RzdCxfc3JjLF9s
ZW4sbGFiZWwpCQkJXAo+PiArZG8gewkJCQkJCQkJCVwKPj4gKwljaGFyICpfX3VjdV9kc3QgPSAo
X2RzdCk7CQkJCQlcCj4+ICsJY29uc3QgY2hhciBfX3VzZXIgKl9fdWN1X3NyYyA9IChfc3JjKTsJ
CQkJXAo+PiArCXNpemVfdCBfX3VjdV9sZW4gPSAoX2xlbik7CQkJCQlcCj4+ICsJdW5zYWZlX2dl
dF9sb29wKF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3VjdV9sZW4sIHU2NCwgbGFiZWwpOwlcCj4+
ICsJdW5zYWZlX2dldF9sb29wKF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3VjdV9sZW4sIHUzMiwg
bGFiZWwpOwlcCj4+ICsJdW5zYWZlX2dldF9sb29wKF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3Vj
dV9sZW4sIHUxNiwgbGFiZWwpOwlcCj4+ICsJdW5zYWZlX2dldF9sb29wKF9fdWN1X2RzdCwgX191
Y3Vfc3JjLCBfX3VjdV9sZW4sIHU4LCBsYWJlbCk7CVwKPj4gICB9IHdoaWxlICgwKQo+PiAgIAo+
PiAgICNpZmRlZiBDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX09VVFBVVAo+PiAtLSAKPj4gMi40OS4w
Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
