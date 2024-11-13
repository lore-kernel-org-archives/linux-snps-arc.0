Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E564D637B0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Nov 2024 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bIr2S56/s1ubJe9iIuxKM0Yt0mfJbRoldv1toDCrjfg=; b=qs4otjLvHE+2nUq51aNuB9ov7R
	Qyah2rn96hi1oGrKE6X94h+T5r4YYmSUgrdzBEK+knEGbXOsOUZjCZXDw1J6PYanuFA0KjqJvACe2
	asqyIcV5n4vRm1qczzUFgH4gKyXqO2EroawO+RYSy0gMykbJp8C3bjy3MU9WLB4/7CR8tzOlfo83i
	l/YOny47taKpqJyVG5TB0BzOSwCmUI2lKFHvb6n6j2yDqKsXnXA3gpL2jAqKzpU7dBwTSwSqJqShF
	+3dC6oBPSyWgHeYHXxy+oMDn4A4fQUmohzG++ARNmySSvM482rNMA0nYO4lLLiQDJbGOs9wTF9ycX
	xCvtBsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJbd-00000007uck-1ZGT;
	Wed, 13 Nov 2024 20:04:49 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJXM-00000007tq0-3BM9
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 Nov 2024 20:00:27 +0000
Date: Wed, 13 Nov 2024 21:00:12 +0100 (GMT+01:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1731528019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrwRcle6eumpiJO2FfVOfK4rQIqM1H+WeqqUrRbeZOM=;
	b=Jq+HR0iPg9e70Lwtzzr5qDjKyPMIuWkoTZxbOZ5KZp0Z1xztXhoOsb0cMIb0lkDmkEEeHC
	7xCnPuQnUn/2RNEpLgrCFS4qThmNYtsaFhl3SpJ3vGTxBYzSZSDlt+E78a98ZsMpxi6y5x
	E7OG3+wKZg3x5qFO51Ys5hKYORTIsAC9P3qvxM4B3HWwaa015FSMlh8AeSedoPWe9PT92f
	KnIjgTQGhsFMW0vfUxQdKhG5eGaQpfNL7sAWH7Ria9kSyl4tzcKkdtVYI40QG5RGjX2AAg
	RXNC9Y5WcJGc4oE8izGiGBGAiQ6pKjPwNzCU7hHdoHrUMDdlpnqEWc5HoekR3g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shahab Vahedi <list+bpf@vahedi.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: ast@kernel.org, vadim.fedorenko@linux.dev,
	tarang.raval@siliconsignals.io,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Vineet Gupta <vgupta@kernel.org>, bpf@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org>
In-Reply-To: <20241113134142.14970-1-hardevsinh.palaniya@siliconsignals.io>
References: <20241113134142.14970-1-hardevsinh.palaniya@siliconsignals.io>
Subject: Re: [PATCH v2] ARC: bpf: Correct conditional check in
 'check_jmp_32'
MIME-Version: 1.0
X-Correlation-ID: <920e71ab-2375-4722-bcf3-d6aaf8e68b3a@vahedi.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_120025_662107_5F85896A 
X-CRM114-Status: GOOD (  14.46  )
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

PiBUaGUgb3JpZ2luYWwgY29kZSBjaGVja3MgJ2lmIChBUkNfQ0NfQUwpJywgd2hpY2ggaXMgYWx3
YXlzIHRydWUgc2luY2UKPiBBUkNfQ0NfQUwgaXMgYSBjb25zdGFudC4gVGhpcyBtYWtlcyB0aGUg
Y2hlY2sgcmVkdW5kYW50IGFuZCBsaWtlbHkKPiBvYnNjdXJlcyB0aGUgaW50ZW50aW9uIG9mIHZl
cmlmeWluZyB3aGV0aGVyIHRoZSBqdW1wIGlzIGNvbmRpdGlvbmFsLgo+Cj4gVXBkYXRlcyB0aGUg
Y29kZSB0byBjaGVjayBjb25kID09IEFSQ19DQ19BTCBpbnN0ZWFkLCByZWZsZWN0aW5nIHRoZSBp
bnRlbnQKPiB0byBkaWZmZXJlbnRpYXRlIGNvbmRpdGlvbmFsIGZyb20gdW5jb25kaXRpb25hbCBq
dW1wcy4KPgo+IFN1Z2dlc3RlZC1ieTogVmFkaW0gRmVkb3JlbmtvIDx2YWRpbS5mZWRvcmVua29A
bGludXguZGV2Pgo+IFNpZ25lZC1vZmYtYnk6IEhhcmRldnNpbmggUGFsYW5peWEgPGhhcmRldnNp
bmgucGFsYW5peWFAc2lsaWNvbnNpZ25hbHMuaW8+Cj4gLS0tCj4KPiBDaGFuZ2Vsb2cgaW4gVjI6
Cj4KPiAtIENoYW5nZWQgc3ViamVjdCBsaW5lCj4gLSBVcGRhdGVkIGNvbmRpdGlvbiBjaGVjayB0
byAnaWYgKGNvbmQgPT0gQVJDX0NDX0FMKScgaW5zdGVhZCBvZiByZW1vdmluZyBpdAo+Cj4gTGlu
ayBmb3IgdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi9lNmQyN2FkYi0xNTFjLTQ2YzEt
OTY2OC0xY2QyYjQ5MjMyMWJAbGludXguZGV2L1QvI3QKPiAtLS0KPiBhcmNoL2FyYy9uZXQvYnBm
X2ppdF9hcmN2Mi5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL25ldC9icGZfaml0X2FyY3YyLmMg
Yi9hcmNoL2FyYy9uZXQvYnBmX2ppdF9hcmN2Mi5jCj4gaW5kZXggNDQ1OGU0MDljYTBhLi42ZDk4
OWI2ZDg4YzYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmMvbmV0L2JwZl9qaXRfYXJjdjIuYwo+ICsr
KyBiL2FyY2gvYXJjL25ldC9icGZfaml0X2FyY3YyLmMKPiBAQCAtMjkxNiw3ICsyOTE2LDcgQEAg
Ym9vbCBjaGVja19qbXBfMzIodTMyIGN1cnJfb2ZmLCB1MzIgdGFyZ19vZmYsIHU4IGNvbmQpCj4g
wqDCoMKgIGFkZGVuZHVtID0gKGNvbmQgPT0gQVJDX0NDX0FMKSA/IDAgOiBJTlNOX2xlbl9ub3Jt
YWw7Cj4gwqDCoMKgIGRpc3AgPSBnZXRfZGlzcGxhY2VtZW50KGN1cnJfb2ZmICsgYWRkZW5kdW0s
IHRhcmdfb2ZmKTsKPgo+IC3CoMKgIGlmIChBUkNfQ0NfQUwpCj4gK8KgwqAgaWYgKGNvbmQgPT0g
QVJDX0NDX0FMKQo+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBpc192YWxpZF9mYXJfZGlzcChkaXNw
KTsKPiDCoMKgwqAgZWxzZQo+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBpc192YWxpZF9uZWFyX2Rp
c3AoZGlzcCk7Cj4gLS0KPiAyLjQzLjAKClRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24h
CgpBY2tlZC1ieTogU2hhaGFiIFZhaGVkaSA8bGlzdCticGZAdmFoZWRpLm9yZz4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
