Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33030C43334
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRxsAeAQrEtrT/C0zRdBN5Sruu+tqujuL+KX5wNoQxo=; b=IC4noyheiuF8yM
	uQTrIHkS9iv0nGcoTrQGtC76P8HrOh+45KwZePM6Ohl8NnnVzk0zohXVOorbdE3Mv6meG4sa37Ccb
	oD7e3m2G+eRhZV7q/8Cz6bkqn5Q4RWLklh8+AvytjpuiOeRoxobEMLWdZA5M1I9r1Mmd/G6EIEg8K
	CwVcjlmJQyQrhXrQDAHc3KbPUzPv8Vuxrl8kVFFVwk3AVNfy9AvHmm5Bsvl9O4hQM8amTOPoSkOh2
	XxMfD/LOBD4KF5hgwwA/IWfqwfZ5kaFPZtNa1ydU5T+qIH2g3jW1pPGOgvFJyr2rVpAmLmVF6/N/k
	bYZEerwDhByad8mJF/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1A7g-00AXhP-Qd; Tue, 14 Jun 2022 17:14:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1A7W-00AXfe-6D
	for linux-snps-arc@lists.infradead.org; Tue, 14 Jun 2022 17:14:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id u12so18431740eja.8
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jun 2022 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=aBa/wr+Rup1HCA9p83HeIrrBF52GjhzrNwGL25DQAkU=;
        b=HtfbER5yJk0bF6giXJmn/L0LmowOrcIyZGiTAsFZIhHM3RpB7UVROQLB9EnNvhPUIQ
         B6TzuqbWA79uNaOyNHee3XzW26z7B8AJxrDoSEluoUg7YsI2qcAE1OZytABOYTyrgWnl
         YZ3/TP5vrJqMQJ/WutHfPW/yL23TxMCAWruitejtAOWSo++cfcFb5BTfzHZ6EWAoYzMJ
         KkDqumK6GPne9EB0L9U/bTbuZIvtGAI+/cKJzrfDmmQeEpBvnWsMrYPyPOso1UC4ASA1
         zW/UeWWzpOdTid1bXyQ1s9fdcw+vW1zyI2OR6lDUQYzLEJxmAEaGLNs6jJOSebUy0PAC
         BZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=aBa/wr+Rup1HCA9p83HeIrrBF52GjhzrNwGL25DQAkU=;
        b=GbHZuoSo6HJbAHqdeRSoDyZRS8BstEf5s68htG6k6hNUOwUccA0KcKf6P34xST7Y70
         y00jMNWQn7sVM4wwQkIjQGomDcbrBEOupGiAEpIMrN0NiVXAk6j/7nfJp4x07v5JOheK
         hpnH8rVLfmXwWTqGfoNLN2wL/56HGsYgxfDshhSzP46IwGbplWgQWuwA17fHjDY0106l
         mwPVmtWvZM1Q+lecHQpEo0qgdr6/txqikaYEE/l+vv7BFNqScYcJOVudgfQO5ZrCdk95
         07KooWsORps2WheTFrnFk7t7x77qAqcoxxkzZ5VG1Q47/8qDvAXpNpyaRM9PgCDW0vUA
         cJ3g==
X-Gm-Message-State: AOAM5311umMEqqBj1WhF64Q9i0Boft7uN4YFHhQdGbSv60hz4Hq4h57O
	3xxW271G1NkBIvfe9/sE+bFCHw==
X-Google-Smtp-Source: ABdhPJwjzlgyn+pPZ7b4ogJ2igFUZIeFUCS/7DFwJMPNpoU2qHtMFlDmxqjLQmgVhmnu5/HcVvDgJg==
X-Received: by 2002:a17:906:2b92:b0:709:236c:de1b with SMTP id m18-20020a1709062b9200b00709236cde1bmr5378599ejg.754.1655226863157;
        Tue, 14 Jun 2022 10:14:23 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
        by smtp.gmail.com with ESMTPSA id w18-20020a05640234d200b0042e09f44f81sm7631432edc.38.2022.06.14.10.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 10:14:22 -0700 (PDT)
Message-ID: <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
Date: Tue, 14 Jun 2022 19:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/1] package/bpftool: revert bpf_cookie patch to allow
 building
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_101426_282298_D80EA0D6 
X-CRM114-Status: GOOD (  34.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 14/06/2022 11:31, Shahab Vahedi wrote:
> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11

  How do you build host-bpftool with clang in Buildroot context? HOSTCC is set 
to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot 
command line? I'm not sure if we are really interested in carrying fixes for 
such exotic and not-really-supported situations...

> fails:
> 
> -----------------------------------8<-----------------------------------
> $ make
>    .
>    .
>    .
>    CLANG    pid_iter.bpf.o
> skeleton/pid_iter.bpf.c:47:14: error: incomplete definition of type
>                                 'struct bpf_perf_link'
>          perf_link = container_of(link, struct bpf_perf_link, link);
>    .
>    .
>    .
> skeleton/pid_iter.bpf.c:49:30: error: no member named 'bpf_cookie' in
>                                 'struct perf_event'
>          return BPF_CORE_READ(event, bpf_cookie);
>    .
>    .
>    .
> 10 errors generated.
> make: *** [Makefile:176: pid_iter.bpf.o] Error 1
> ----------------------------------->8-----------------------------------
> 
> There are changes in bpftool v6.8.0 that assumes the existence of
> particular data structures in generated vmlinux.h that is obtained
> from the host machine. See [1] for further details. This commit adds
> a patch to revert that additional change in v6.8.0.
> 
> There's a patch series pending to be submitted upstream [2]. Hopefully,
> those will take care of the problem if they land in the next release.
> 
> Changelog:

  Patch changelog should be under the --- line, it's not meant to be part of the 
git history. But of course that means you need to put the references [1][2] 
above the --- line.

  (No need to resend for this or any of my other comments, just FYI for future 
submissions.)

> v1: Initial submission [3]

It's nice, but not really necessary to have a reference to the old versions. 
They're easy enough to find back.

> v2: Use a full fledged git patch for bpftool [4]
> v3: Fix the snafu that resulted in malformed patch file
> 
> [1]
> https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u
> 
> [2]
> https://lore.kernel.org/bpf/20220421003152.339542-1-alobakin@pm.me/
> 
> [3]
> https://lists.buildroot.org/pipermail/buildroot/2022-June/644819.html

  To refer to a buildroot patch, it's nicer to refer to patchwork, i.e.
https://patchwork.ozlabs.org/project/buildroot/patch/97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com/

  Regards,
  Arnout

> 
> [4]
> https://lists.buildroot.org/pipermail/buildroot/2022-June/644824.html
> 
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
> ---
>   .../0002-revert-bpf_cookie-change.patch       | 129 ++++++++++++++++++
>   1 file changed, 129 insertions(+)
>   create mode 100644 package/bpftool/0002-revert-bpf_cookie-change.patch
> 
> diff --git a/package/bpftool/0002-revert-bpf_cookie-change.patch b/package/bpftool/0002-revert-bpf_cookie-change.patch
> new file mode 100644
> index 0000000000..6f9579bd23
> --- /dev/null
> +++ b/package/bpftool/0002-revert-bpf_cookie-change.patch
> @@ -0,0 +1,129 @@
> +From d7c78d1e38cde73c85b491a833f0e6e3f0d62654 Mon Sep 17 00:00:00 2001
> +From: Shahab Vahedi <shahab@synopsys.com>
> +Date: Tue, 14 Jun 2022 10:12:21 +0200
> +Subject: [PATCH] Revert commit "bpftool: Add bpf_cookie to link output"
> +
> +Building bpftool on a Debian bullseye with clang-11 fails [1].
> +This patch reverts the offending commit [2]. If clang-11 is not
> +installed, then the "co-re" feature of bpf will not be enabled
> +and the issue remains dormant.
> +
> +[1] Building release 6.8.0 on Debian 11
> +https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u
> +
> +[2] bpftool: Add bpf_cookie to link output
> +https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=cbdaf71f
> +
> +Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
> +---
> + src/main.h                  |  2 --
> + src/pids.c                  |  8 --------
> + src/skeleton/pid_iter.bpf.c | 22 ----------------------
> + src/skeleton/pid_iter.h     |  2 --
> + 4 files changed, 34 deletions(-)
> +
> +diff --git a/src/main.h b/src/main.h
> +index aa99ffa..2f2b638 100644
> +--- a/src/main.h
> ++++ b/src/main.h
> +@@ -111,9 +111,7 @@ struct obj_ref {
> +
> + struct obj_refs {
> + 	int ref_cnt;
> +-	bool has_bpf_cookie;
> + 	struct obj_ref *refs;
> +-	__u64 bpf_cookie;
> + };
> +
> + struct btf;
> +diff --git a/src/pids.c b/src/pids.c
> +index e2d00d3..57f0d1b 100644
> +--- a/src/pids.c
> ++++ b/src/pids.c
> +@@ -78,8 +78,6 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
> + 	ref->pid = e->pid;
> + 	memcpy(ref->comm, e->comm, sizeof(ref->comm));
> + 	refs->ref_cnt = 1;
> +-	refs->has_bpf_cookie = e->has_bpf_cookie;
> +-	refs->bpf_cookie = e->bpf_cookie;
> +
> + 	err = hashmap__append(map, u32_as_hash_field(e->id), refs);
> + 	if (err)
> +@@ -206,9 +204,6 @@ void emit_obj_refs_json(struct hashmap *map, __u32 id,
> + 		if (refs->ref_cnt == 0)
> + 			break;
> +
> +-		if (refs->has_bpf_cookie)
> +-			jsonw_lluint_field(json_writer, "bpf_cookie", refs->bpf_cookie);
> +-
> + 		jsonw_name(json_writer, "pids");
> + 		jsonw_start_array(json_writer);
> + 		for (i = 0; i < refs->ref_cnt; i++) {
> +@@ -238,9 +233,6 @@ void emit_obj_refs_plain(struct hashmap *map, __u32 id, const char *prefix)
> + 		if (refs->ref_cnt == 0)
> + 			break;
> +
> +-		if (refs->has_bpf_cookie)
> +-			printf("\n\tbpf_cookie %llu", (unsigned long long) refs->bpf_cookie);
> +-
> + 		printf("%s", prefix);
> + 		for (i = 0; i < refs->ref_cnt; i++) {
> + 			struct obj_ref *ref = &refs->refs[i];
> +diff --git a/src/skeleton/pid_iter.bpf.c b/src/skeleton/pid_iter.bpf.c
> +index eb05ea5..f70702f 100644
> +--- a/src/skeleton/pid_iter.bpf.c
> ++++ b/src/skeleton/pid_iter.bpf.c
> +@@ -38,17 +38,6 @@ static __always_inline __u32 get_obj_id(void *ent, enum bpf_obj_type type)
> + 	}
> + }
> +
> +-/* could be used only with BPF_LINK_TYPE_PERF_EVENT links */
> +-static __u64 get_bpf_cookie(struct bpf_link *link)
> +-{
> +-	struct bpf_perf_link *perf_link;
> +-	struct perf_event *event;
> +-
> +-	perf_link = container_of(link, struct bpf_perf_link, link);
> +-	event = BPF_CORE_READ(perf_link, perf_file, private_data);
> +-	return BPF_CORE_READ(event, bpf_cookie);
> +-}
> +-
> + SEC("iter/task_file")
> + int iter(struct bpf_iter__task_file *ctx)
> + {
> +@@ -80,19 +69,8 @@ int iter(struct bpf_iter__task_file *ctx)
> + 	if (file->f_op != fops)
> + 		return 0;
> +
> +-	__builtin_memset(&e, 0, sizeof(e));
> + 	e.pid = task->tgid;
> + 	e.id = get_obj_id(file->private_data, obj_type);
> +-
> +-	if (obj_type == BPF_OBJ_LINK) {
> +-		struct bpf_link *link = (struct bpf_link *) file->private_data;
> +-
> +-		if (BPF_CORE_READ(link, type) == BPF_LINK_TYPE_PERF_EVENT) {
> +-			e.has_bpf_cookie = true;
> +-			e.bpf_cookie = get_bpf_cookie(link);
> +-		}
> +-	}
> +-
> + 	bpf_probe_read_kernel_str(&e.comm, sizeof(e.comm),
> + 				  task->group_leader->comm);
> + 	bpf_seq_write(ctx->meta->seq, &e, sizeof(e));
> +diff --git a/src/skeleton/pid_iter.h b/src/skeleton/pid_iter.h
> +index bbb570d..5692cf2 100644
> +--- a/src/skeleton/pid_iter.h
> ++++ b/src/skeleton/pid_iter.h
> +@@ -6,8 +6,6 @@
> + struct pid_iter_entry {
> + 	__u32 id;
> + 	int pid;
> +-	__u64 bpf_cookie;
> +-	bool has_bpf_cookie;
> + 	char comm[16];
> + };
> +
> +--
> +2.30.2
> +

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
