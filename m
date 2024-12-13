Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE82E77180
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgrfRcQ5D7A6ERgXNvs+eXnZOj83NHCoL0Ihmlfk+yE=; b=mYorVxIBU6aa9U
	soSo2cX1/PP2ymPnUyBU1kKGmvPT/1gdvXbXk8tiKGmaY6d9Oc651xuIiB0BVbjhRPf5qq2F6ED4b
	SfQQbEiQRqpPPAe6MfIU/qs2Scq+vWEgFTUelBKg/4wwhlAghx2ly19WlpbJBj6VPdBdBBVITH7C7
	JoMkGpacAmaVxjglMLxfLaJaO3e1MwStczQwihRvAnMoh2fRRnXic4SdPBujRMimph7E0roANSKrh
	rF0pcaHSym+z0cJQS4wQyIrHKGSOsw9/tHR1hiuUjXUoxRvpRBZXXIDs5S/lgSIzlJpFUg/rxrTzp
	YQXE8nyGSGojbwvf9+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyVy-00000002nZn-1HlN;
	Fri, 13 Dec 2024 05:47:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyVw-00000002nYX-1jps
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:47:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21644aca3a0so16639045ad.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068819; x=1734673619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVaAhWgLsrOIaawWt+Es3lyBYssP2HU9Cngct4cKfGw=;
        b=Zcp6MC4bCcz3ZhK1T7rFNvfT6BzcJD4MeaMFZO9ROpotAV/SjOiB8+vlW5kLrbDieV
         uJ76yGJaWVqqLlL44lZi6LyuRxGmcyh5KGirXm/jFf93/1d7vbgnchOIxKs+npPJpKMp
         n6XfiiBFZcd/Y1lrDP7tx+zJCqwaa9/4OQGWWGfn8OxBIdFe+O+/CVZ27bOwd/nJGfOa
         GA8HdxFN3lpPTvivFRjG8wCBgh3K9QNRJsi4STiqgbPv8NjMevzhJ5kCCBCgm/zDjFEy
         2/zfZ2jXs3Kpz9GtqGvY3laRxy4JdV2PwmL0jZA7hhSpEKrTR1IsG6vy1gV8zgtOGeNP
         RMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068819; x=1734673619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVaAhWgLsrOIaawWt+Es3lyBYssP2HU9Cngct4cKfGw=;
        b=W94J4bvqcI6Q4rcOpoSsZAV8GowZz2CqRwbuFMGsTWl+YltArk+nc2f51dsuCDjU7x
         P4UYlaRIdA3tegKokxLCNNrVpqpQz5urjI2fBulaR2mVbmlWV4jBAsZGOOR0MnjlNfJK
         ocCYIzLKYtNN0q0ouVECd5GMxIl2EEwxajRi99g+fVZHdTBSKR0aQfhw+mCAFFOLwyfz
         WSQFJw/n0aJsmHrJ9gHZDWnOR+gYvGrDEjpVundUXt8slPEIdTO+FeMALmP3FcBmJbRs
         dfs/mla7rvpOFS7D9YdWhIeE1URJYBGT4PCkp2WXpqnLtwZcLLl3JL1+Y2ZgdLxXO82+
         ia6g==
X-Forwarded-Encrypted: i=1; AJvYcCUoJiQ8qskLHFTiisECZ+mjjAtaXtDZj4XRn5YMuJjb4DtL77W8YSpeJRD9UGJRELMRd6/KJHHCcQQzEcUASw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz3yV4PxQ8p3uuefmjukCETqUBp+5zq4r+ltgRW3jVJMDi4EAY
	RPO16ctfDKrz5RH5OdbwbTm3AATkFZGv5oBVqD7HKDntXdiwlhCE
X-Gm-Gg: ASbGncu6Zn4ajKmQrAe5etnSQMU60a+2oNE0MuidZnq9UxXr0XIV6h3os84oppsUAJF
	tqll7fuM/g6JCgoGahU5oyIFu4dsoRmHirGPToigF3lbq2t9+24sHPmUedy3yxsSnxWC7io0IfW
	YEiArjsMxQzjuFYiX3F1Sov1LUm6xBYjbsFsgDAN3H8kRcIC4hBO/KUgtEALEQMRdGTymX45Wup
	YYlzQX3NzR3Fv4w8S18c9Y0YaPfj1QS4ESZE8M1JxuY0SIiF6fOFD3K+DydaMBPcKML7JDa3i+z
	huGrMw0=
X-Google-Smtp-Source: AGHT+IGnQMpyX4qO4c9TaUxIvkW9bvqpb4HtTDVE3C9gZFkXCVV6ksZB8lAWhFJzpiBj11HO1t8PNw==
X-Received: by 2002:a17:902:e88b:b0:212:615f:c1 with SMTP id d9443c01a7336-218929a19c2mr20599995ad.14.1734068819460;
        Thu, 12 Dec 2024 21:46:59 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.46.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:46:58 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	ocfs2-devel@lists.linux.dev,
	Yafang Shao <laoar.shao@gmail.com>,
	Serge Hallyn <serge@hallyn.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 2/7] kernel: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:05 +0800
Message-Id: <20241213054610.55843-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214700_449930_FD275481 
X-CRM114-Status: GOOD (  12.64  )
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

U2luY2UgdGFzay0+Y29tbSBpcyBndWFyYW50ZWVkIHRvIGJlIE5VTC10ZXJtaW5hdGVkLCB3ZSBj
YW4gcHJpbnQgaXQKZGlyZWN0bHkgd2l0aG91dCB0aGUgbmVlZCB0byBjb3B5ZSBpdCBpbnRvIGEg
c2VwYXJhdGUgYnVmZmVyLiBUaGlzCnNpbXBsaWZpZXMgdGhlIGNvZGUgYW5kIGF2b2lkcyB1bm5l
Y2Vzc2FyeSBvcGVyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogWWFmYW5nIFNoYW8gPGxhb2FyLnNo
YW9AZ21haWwuY29tPgpDYzogU2VyZ2UgSGFsbHluIDxzZXJnZUBoYWxseW4uY29tPgpDYzogVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29A
cmVkaGF0LmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6
IERhcnJlbiBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz4KQ2M6IERhdmlkbG9ociBCdWVzbyA8
ZGF2ZUBzdGdvbGFicy5uZXQ+CkNjOiAiQW5kcsOpIEFsbWVpZGEiIDxhbmRyZWFsbWVpZEBpZ2Fs
aWEuY29tPgotLS0KIGtlcm5lbC9jYXBhYmlsaXR5LmMgICAgIHwgMTIgKysrKy0tLS0tLS0tCiBr
ZXJuZWwvZnV0ZXgvd2FpdHdha2UuYyB8ICA1ICsrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2NhcGFiaWxp
dHkuYyBiL2tlcm5lbC9jYXBhYmlsaXR5LmMKaW5kZXggZGFjNGRmNzdlMzc2Li40NTEyY2Q3OTdm
NDkgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9jYXBhYmlsaXR5LmMKKysrIGIva2VybmVsL2NhcGFiaWxp
dHkuYwpAQCAtMzgsMTAgKzM4LDggQEAgX19zZXR1cCgibm9fZmlsZV9jYXBzIiwgZmlsZV9jYXBz
X2Rpc2FibGUpOwogCiBzdGF0aWMgdm9pZCB3YXJuX2xlZ2FjeV9jYXBhYmlsaXR5X3VzZSh2b2lk
KQogewotCWNoYXIgbmFtZVtzaXplb2YoY3VycmVudC0+Y29tbSldOwotCi0JcHJfaW5mb19vbmNl
KCJ3YXJuaW5nOiBgJXMnIHVzZXMgMzItYml0IGNhcGFiaWxpdGllcyAobGVnYWN5IHN1cHBvcnQg
aW4gdXNlKVxuIiwKLQkJICAgICBnZXRfdGFza19jb21tKG5hbWUsIGN1cnJlbnQpKTsKKwlwcl9p
bmZvX29uY2UoIndhcm5pbmc6IGAlcFROJyB1c2VzIDMyLWJpdCBjYXBhYmlsaXRpZXMgKGxlZ2Fj
eSBzdXBwb3J0IGluIHVzZSlcbiIsCisJCSAgICAgY3VycmVudCk7CiB9CiAKIC8qCkBAIC02Miwx
MCArNjAsOCBAQCBzdGF0aWMgdm9pZCB3YXJuX2xlZ2FjeV9jYXBhYmlsaXR5X3VzZSh2b2lkKQog
CiBzdGF0aWMgdm9pZCB3YXJuX2RlcHJlY2F0ZWRfdjIodm9pZCkKIHsKLQljaGFyIG5hbWVbc2l6
ZW9mKGN1cnJlbnQtPmNvbW0pXTsKLQotCXByX2luZm9fb25jZSgid2FybmluZzogYCVzJyB1c2Vz
IGRlcHJlY2F0ZWQgdjIgY2FwYWJpbGl0aWVzIGluIGEgd2F5IHRoYXQgbWF5IGJlIGluc2VjdXJl
XG4iLAotCQkgICAgIGdldF90YXNrX2NvbW0obmFtZSwgY3VycmVudCkpOworCXByX2luZm9fb25j
ZSgid2FybmluZzogYCVwVE4nIHVzZXMgZGVwcmVjYXRlZCB2MiBjYXBhYmlsaXRpZXMgaW4gYSB3
YXkgdGhhdCBtYXkgYmUgaW5zZWN1cmVcbiIsCisJCSAgICAgY3VycmVudCk7CiB9CiAKIC8qCmRp
ZmYgLS1naXQgYS9rZXJuZWwvZnV0ZXgvd2FpdHdha2UuYyBiL2tlcm5lbC9mdXRleC93YWl0d2Fr
ZS5jCmluZGV4IDNhMTAzNzVkOTUyMS4uZGY4ZjhjODVkNzc2IDEwMDY0NAotLS0gYS9rZXJuZWwv
ZnV0ZXgvd2FpdHdha2UuYworKysgYi9rZXJuZWwvZnV0ZXgvd2FpdHdha2UuYwpAQCAtMjEwLDEz
ICsyMTAsMTIgQEAgc3RhdGljIGludCBmdXRleF9hdG9taWNfb3BfaW51c2VyKHVuc2lnbmVkIGlu
dCBlbmNvZGVkX29wLCB1MzIgX191c2VyICp1YWRkcikKIAogCWlmIChlbmNvZGVkX29wICYgKEZV
VEVYX09QX09QQVJHX1NISUZUIDw8IDI4KSkgewogCQlpZiAob3BhcmcgPCAwIHx8IG9wYXJnID4g
MzEpIHsKLQkJCWNoYXIgY29tbVtzaXplb2YoY3VycmVudC0+Y29tbSldOwogCQkJLyoKIAkJCSAq
IGtpbGwgdGhpcyBwcmludCBhbmQgcmV0dXJuIC1FSU5WQUwgd2hlbiB1c2Vyc3BhY2UKIAkJCSAq
IGlzIHNhbmUgYWdhaW4KIAkJCSAqLwotCQkJcHJfaW5mb19yYXRlbGltaXRlZCgiZnV0ZXhfd2Fr
ZV9vcDogJXMgdHJpZXMgdG8gc2hpZnQgb3AgYnkgJWQ7IGZpeCB0aGlzIHByb2dyYW1cbiIsCi0J
CQkJCWdldF90YXNrX2NvbW0oY29tbSwgY3VycmVudCksIG9wYXJnKTsKKwkJCXByX2luZm9fcmF0
ZWxpbWl0ZWQoImZ1dGV4X3dha2Vfb3A6ICVwVE4gdHJpZXMgdG8gc2hpZnQgb3AgYnkgJWQ7IGZp
eCB0aGlzIHByb2dyYW1cbiIsCisJCQkJCSAgICBjdXJyZW50LCBvcGFyZyk7CiAJCQlvcGFyZyAm
PSAzMTsKIAkJfQogCQlvcGFyZyA9IDEgPDwgb3Bhcmc7Ci0tIAoyLjQzLjUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
