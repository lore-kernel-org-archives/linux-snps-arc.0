Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81FFC433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Oct 2022 06:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5afidOCubUTabIN/Dxek7cb1jXyENnJl+74a1Yqz50A=; b=Hu8RjfR/R6Qb+/
	psWK7BbBMGlDwFf9t09a+mFYz6Fr57G0lMwbbvfZPj81DhT0pKsJ557+VF9K01pwZSJH/Xa9+zrst
	dkPWRYHJ5Ir7x9V4KjdSSA8lwqUnd0g72MsxtPOPglQh++U/ScaRr9Icpg4PcrL9p5RRHlzOu/Vxs
	FAJpgip4kTbvw71RzsT7XgYoWjUDGuSyeJA6ENgC5EH0ZFcH1qd5p4VYt4BUK+38NNCtuuWF3qX+n
	rVkVQFCH56ZUz9wPhbMcGiuF+zRslDvfHrZjXPbuUrFnF4DHXKt7lYsIBdeBMTSgxmHuWcwUSply2
	brK1t/9Q2G/komj8HKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohm5j-00HDOn-0W; Mon, 10 Oct 2022 06:16:43 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohm5g-00HDMs-5T; Mon, 10 Oct 2022 06:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1665382584;
	bh=t5oCng6qrXN7iFHvVA23nQRcP3eRpq4/4Y+SJ+WKMQI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BxebPkM/d0tk1ML8vaIZiVAFv3HZhfphqPc0aJKN5r9MPhyBDw+u91Ym49xEhwnf7
	 C+BnpJ/tgtQMifG0g2r4qbxOdb7F5JUzp+vi+CPx9gUHlsQ4bogs61H0yhjMpt9tZI
	 yZgWB2aD/tImchBr6Riipr1B5i3rdRGmgN3jZmgI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1oTo0B20UV-00Mvbw; Mon, 10
 Oct 2022 08:16:24 +0200
Message-ID: <9f0b3333-bb28-c739-9bff-6fc50343b4f9@gmx.de>
Date: Mon, 10 Oct 2022 08:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/4] arc: Use generic dump_stack_print_cmdline()
 implementation
Content-Language: en-US
To: Vineet Gupta <vineet.gupta@linux.dev>, linux-s390@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
References: <20220808130917.30760-1-deller@gmx.de>
 <20220808130917.30760-5-deller@gmx.de>
 <8da9812d-eb84-2a84-321e-ea2826ef8981@linux.dev>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <8da9812d-eb84-2a84-321e-ea2826ef8981@linux.dev>
X-Provags-ID: V03:K1:NudOz7Pq8zqMzpDkWxd+lvw7MQLHFVHX4y2D3B0lFEDuIKKr66h
 qegUDgOH06dY83pJcJsE8la8/wqBLjQilAdyHfNW5OH54FBiT1VLNreHyu0NRHrlEcsSOLy
 +yFRkaihB4vP1N2x0uNckW/llOKv6XGjxN+5YnddWyS642ImXCjF9f8FJuuWfjgGBQEmN9e
 +sLRo1pOuHdypN3cwk4wQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OCcy9hBZBVE=:fJJDrowGKWaX2xVI3tu20J
 hS+T2B7yjXar8ybNkNOfrm650gvN6sWFh1Diw3RxZ2e4fMd7Tb0al7oqcHxC22HAn60Cn0kOp
 Cmezn+WVPZ0+bm5xCV2SRV5SHKwctYtlvjYKCG8x0GuolXpdU9COln/arXMau6HyZfdpIbKkK
 oFRYln23V8eOAQDTICFAm7pxr6dYOpcl/fnZNQQWWShthwVKX/LpwLOxpyXmHNtsyG+Kr1A5M
 jk+VVjI6Spzk03if5HW5mA4p5S7QU4NSCNyyqR81STu6qQ3SCuvQeZDnREWmGgwgcXOLmp6V1
 t/qrrYNuQKWed1qEUyPX01K0J7Pssk+Y103CaSiiEza0gKI0DCT9HhaNIlvnqKBW0BTQwL4sI
 Qys3/UKX4zrjBs/vl8iwWfyPuAScmqnzvmtJR6WDcq5fSnO6Cdh9vqPvM0cjpv+WXV/fuWqOh
 QB6ksyFUi7NUGy1SCvYHh1y3MjgBqp+rkMpGaJmPor6lJ39P4Ou0EmxFMClcMXWreHo4KDvLC
 htq2K726CjBMI7a8aPyn+M4rooQC4V/379XOWMFUL9crKufBL61UQ0M8OwgQhzp2iRy9bkAFn
 8cHdmQqEaYbIVZGD3eXybfdZR0DvWYcp6G/7TGvdIXe6a7NkCKYgq2/02rA12shd63TMkRWtv
 PauahAOqu/0XMC/Gko3pcuhbECP2Wy5vM5UPokbmRNrP+XBmiDBCLQP4uo+nKm+o2jufLTzTV
 lRn0x6LuzuywMXZ60mV9inyOcskjnc2d6zGr2J7ZST0+uINAkN/89mhlqcrh7WdY3ZialzXdK
 WSCwYEa3zeTiezGmKGb0dPMa+Y+ZZOhvVmtjjvVRsCuPiwKW3jWEXB2yiSYytRlaYa+UYczvl
 RXMp8YWHth6+Te13FpZaeNaLKYZim2CocI/gfiFuCgNhvG14t5IsATN50cJwbLerOhzGdcJCb
 8TkMOsaerDDqEXrpEZqWYp+1+P1jdhvFN6EdNoGjCdi51XUzoJg9b93/rW4kV1GUcb6BgC/8B
 o0dIi7l+vV2Eif81NtZiAaHJw9oNDIjhxnbvGvxuaRV9Qh2clQFCRc1NnzJTkDXs43SHUld9y
 HoWkZX4SBuAPoluTb9fw3sk7LAYhbdD9uJN+Xf6trl+6Cog9YgtpuEncwR6oahQ1xUHwYQylO
 bVnewqqTL1sJF8kDTjRrITx0zZUgHndHAMom8BjHN/7h7nKaaXmrOVRGwwl/iylJqlMkVP1NW
 DDwK9rOAY659rRm1hbcdr6X2zCQ3NPnZSKorkuEn4pJE1SV6J2DyGXNr/BCLIJ5wlCWHeh45p
 z4OlI8yl0/DsqsFnZQcw00Bi69s4tKfzwcpUqxNnaeoE+7mHJQPrmyUOu4CTwXpPpL/2yB3nK
 3ZSgwaO7wNZoUl0AEv+HB7L1O5pNH5NYBlpWlqCU/MX+qBMhew07dijVHW9Lf+9gnnNx7FzY5
 VgHl56FMusEvqFtCrxNeDWIXEmsyJ2HPJyixuKxn3c/U+A7myFi+AHjm7R2+9zd/tgAnDdsAe
 2Yde0koapcghlSai9bOgidFxV+3HFIrMJPFdbaVWj8Vyb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_231640_726637_8AA79C18 
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

T24gMTAvMTAvMjIgMDc6MTgsIFZpbmVldCBHdXB0YSB3cm90ZToKPiBPbiA4LzgvMjIgMDY6MDks
IEhlbGdlIERlbGxlciB3cm90ZToKPj4gVGhlIHByb2Nlc3MgcHJvZ3JhbSBuYW1lIGFuZCBjb21t
YW5kIGxpbmUgaXMgbm93IHNob3duIGluIGdlbmVyaWMgY29kZQo+PiBpbiBkdW1wX3N0YWNrX3By
aW50X2luZm8oKSwgc28gZHJvcCB0aGUgYXJjLXNwZWNpZmljIGltcGxlbWVudGF0aW9uLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+Cj4KPiBCdXQgdGhh
dCBpbmZvIHByaW50aW5nIHdhcyBhZGRlZCBiYWNrIGluIDIwMTggYnkgZTM2ZGYyOGY1MzJmODgy
Lgo+IEkgZG9uJ3QgdGhpbmsgYXJjIGlzIHVzaW5nIHNob3dfcmVnc19wcmludF9pbmZvIC0+IGR1
bXBfc3RhY2tfcHJpbnRfaW5mbyB5ZXQuCj4gT3IgaXMgdGhlcmUgYSBkaWZmZXJlbnQgY29kZSBw
YXRoIG5vdyB3aGljaCBjYWxscyBoZXJlID8KClJpZ2h0LgpTZWUgcGF0Y2hlcyAjMSBhbmQgIzIg
b2YgdGhpcyBzZXJpZXMgd2hpY2ggYWRkZWQgdGhpcwppbmZvIHRvIGR1bXBfc3RhY2tfcHJpbnRf
aW5mbygpLgoKCj4+IC0tLQo+PiDCoCBhcmNoL2FyYy9rZXJuZWwvdHJvdWJsZXNob290LmMgfCAy
NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMva2VybmVsL3Ryb3VibGVzaG9vdC5j
IGIvYXJjaC9hcmMva2VybmVsL3Ryb3VibGVzaG9vdC5jCj4+IGluZGV4IDc2NTRjMmU0MmRjMC4u
OTgwN2U1OTBlZTU1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FyYy9rZXJuZWwvdHJvdWJsZXNob290
LmMKPj4gKysrIGIvYXJjaC9hcmMva2VybmVsL3Ryb3VibGVzaG9vdC5jCj4+IEBAIC01MSwyOSAr
NTEsNiBAQCBzdGF0aWMgdm9pZCBwcmludF9yZWdzX2NhbGxlZShzdHJ1Y3QgY2FsbGVlX3JlZ3Mg
KnJlZ3MpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWdzLT5yMjQsIHJlZ3MtPnIyNSk7Cj4+IMKg
IH0KPj4KPj4gLXN0YXRpYyB2b2lkIHByaW50X3Rhc2tfcGF0aF9uX25tKHN0cnVjdCB0YXNrX3N0
cnVjdCAqdHNrKQo+PiAtewo+PiAtwqDCoMKgIGNoYXIgKnBhdGhfbm0gPSBOVUxMOwo+PiAtwqDC
oMKgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tOwo+PiAtwqDCoMKgIHN0cnVjdCBmaWxlICpleGVfZmls
ZTsKPj4gLcKgwqDCoCBjaGFyIGJ1ZltBUkNfUEFUSF9NQVhdOwo+PiAtCj4+IC3CoMKgwqAgbW0g
PSBnZXRfdGFza19tbSh0c2spOwo+PiAtwqDCoMKgIGlmICghbW0pCj4+IC3CoMKgwqDCoMKgwqDC
oCBnb3RvIGRvbmU7Cj4+IC0KPj4gLcKgwqDCoCBleGVfZmlsZSA9IGdldF9tbV9leGVfZmlsZSht
bSk7Cj4+IC3CoMKgwqAgbW1wdXQobW0pOwo+PiAtCj4+IC3CoMKgwqAgaWYgKGV4ZV9maWxlKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoCBwYXRoX25tID0gZmlsZV9wYXRoKGV4ZV9maWxlLCBidWYsIEFS
Q19QQVRIX01BWC0xKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGZwdXQoZXhlX2ZpbGUpOwo+PiAtwqDC
oMKgIH0KPj4gLQo+PiAtZG9uZToKPj4gLcKgwqDCoCBwcl9pbmZvKCJQYXRoOiAlc1xuIiwgIUlT
X0VSUihwYXRoX25tKSA/IHBhdGhfbm0gOiAiPyIpOwo+PiAtfQo+PiAtCj4+IMKgIHN0YXRpYyB2
b2lkIHNob3dfZmF1bHRpbmdfdm1hKHVuc2lnbmVkIGxvbmcgYWRkcmVzcykKPj4gwqAgewo+PiDC
oMKgwqDCoMKgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+PiBAQCAtMTc2LDcgKzE1Myw2
IEBAIHZvaWQgc2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiDCoMKgwqDCoMKgwqAg
Ki8KPj4gwqDCoMKgwqDCoCBwcmVlbXB0X2VuYWJsZSgpOwo+Cj4gTWF5YmUgd2UgcmVtb3ZlIHBy
ZWVtcHQqIGFzIHdlbGwgbm93IChwZXJoYXBzIGFzIGEgZm9sbG93IHVwIHBhdGNoKQo+IHNpbmNl
IHRoYXQgd2FzIGFkZGVkIGJ5IGY3MzFhOGU4OWY4Yzc4ICJBUkM6IHNob3dfcmVnczogbG9ja2Rl
cDoKPiByZS1lbmFibGUgcHJlZW1wdGlvbiIgd2hlcmUgc2hvd19yZWdzIC0+IHByaW50X3Rhc2tf
cGF0aF9uX25tIC0+Cj4gbW1wdXQgd2FzIHRyaWdnZXJpbmcgbG9ja2RlcCBzcGxhdCB3aGljaCBp
cyBzdXBwb3NlZGx5IHJlbW92ZWQuCgpUaGUgcGF0Y2ggc2VyaWVzIHdhcyBkcm9wcGVkIGZyb20g
QW5kcmV3J3MgcXVldWUsIGJlY2F1c2UgdGhlIGtlcm5lbAp0ZXN0IHJvYm90IHNob3dlZCBzb21l
IGlzc3VlczoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZdTU5UWRWcFBnblhVblFDQHhz
YW5nLU9wdGlQbGV4LTkwMjAvCk1heWJlIGFkZGluZyBwcmVlbXB0X2VuYWJsZSgpIGluIG15IHBh
dGNoZXMgd291bGQgZml4IHRoYXQgLQpzYWRseSBJIGhhdmVuJ3QgaGFkIHRpbWUgdG8gZm9sbG93
IHVwIG9uIHRoaXMgeWV0IC4uLgoKSGVsZ2UKCj4KPj4KPj4gLcKgwqDCoCBwcmludF90YXNrX3Bh
dGhfbl9ubSh0c2spOwo+PiDCoMKgwqDCoMKgIHNob3dfcmVnc19wcmludF9pbmZvKEtFUk5fSU5G
Tyk7Cj4+Cj4+IMKgwqDCoMKgwqAgc2hvd19lY3JfdmVyYm9zZShyZWdzKTsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
