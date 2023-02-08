Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC81C636CC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Feb 2023 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4Wtp5M9fiovlBP2BccH19VxPR/1NvyrVhimZ452GPU=; b=KnnUyY+qxuSPrO
	V9JtLxXzykm8YNXRrwlWywfakngQv/8EQ2gZfAZgVPVRm0IYC4LYnBGGbnFzSdG394BUrW+6/TkNi
	mqyhXXlQJGTe1FNt/8MAt7eukkRpfWgTx5FlXGe/cP5uOeoojzbNZn9MGD/2KT6dDTUZAAmKDpa0X
	9tsbRfEKDL5jfJEqZCXvlWOYn80ZYVjDMNDps+Z3fuB1271wM/rF9XsXrrFDGri0OgDi33L2vRJbG
	E4Z+p+zBfi0ralrMb/PL9+wPUioiC5FN6pRf2UFFfC6Bxk7n3eASShmTvBl2+alBR2h74rxTCSZbB
	gycvb+mBgK/PeYG+5A+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnRJ-00GGwH-M0; Wed, 08 Feb 2023 16:36:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnRA-00GGsr-Mx
	for linux-snps-arc@lists.infradead.org; Wed, 08 Feb 2023 16:36:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id h16so17343297wrz.12
        for <linux-snps-arc@lists.infradead.org>; Wed, 08 Feb 2023 08:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQa6/znULEhV+sYOlcfqmb4vlX+xnLXUZv3JZfmCoJU=;
        b=bPDWX1T6Zjl5N7Jdn7ZIQppwUk7fXBvQi/a/IwRSbdJ8iELbU+sbPZlk4jFo1AtXwL
         ovhfXSTnXQ4cCBEp3PH5rtrGJKAOuPz+dDrie/8jJiBtJrvDTdtzCRnUUFFD6uZwcFK7
         lAdG/M3CR8kFtNClhmZ3AApYscLgVKiiDxnx1+cDp6t+iZzqoitFw4q2/7hdmp65dRgg
         8rUwvcaRtim4/NrPVmTRwWlU0T3gfgXv4PrWLcPHe6dROjOTGhWRTBM7m7VhSoKIoUUU
         0ujeMaf4rCe4500PMb509NfWBYGIMpkNT5W0sxjzwP0D3aK4zMecTRpIsUznLlA5U2DY
         weVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQa6/znULEhV+sYOlcfqmb4vlX+xnLXUZv3JZfmCoJU=;
        b=i2I0d+UHicTdFXBu6iOcSvC7sIxEKGIpKrJUn10BYIVAAtpoK3ZII2582J5c/qYxfn
         5HIp4a6fKGUEIaXUqF2x/DEHGGVNbl11rTBU/dN9Lt0O28CTaYqU59sNNSej1dmzck1D
         swLAImotWUuLGj5rSOTOauhQxFi6vqb1MFPE+mWeva05T7EhSIkv/uEFa4eI+vkCjeHq
         vapfjV0iDY+1GZA4O9fElVwrsoc2WepSm02Be0EA/pw3wn25FMXn36E6F29VO8Q/g75i
         XhtWx6Un1w/rgo91fk0UOKwGakXaGcXfcDvb22NwPO8PW9bfNjmqfuFBdp+uPXO1PEZf
         nPHA==
X-Gm-Message-State: AO0yUKXY0Zlli9Cq7G9b0SEsK2viQ0lIVN1YQRxn3mHBsPVvyGEqpMTp
	hO2LIhvxJFzIVHMbHCHl+AJ6pg==
X-Google-Smtp-Source: AK7set8ll6oYzBompAjADXX+m788IT0oWDr5DqYSi2Kxwkgphcx3uGeMbQoJSlbIn2Jc0ZptkTa6lQ==
X-Received: by 2002:a05:6000:1091:b0:2c3:e5e6:f0d8 with SMTP id y17-20020a056000109100b002c3e5e6f0d8mr7290653wrw.11.1675874204077;
        Wed, 08 Feb 2023 08:36:44 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d4572000000b002c3e7474b0fsm8388664wrc.13.2023.02.08.08.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 08:36:43 -0800 (PST)
Message-ID: <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
Date: Wed, 8 Feb 2023 17:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_083649_083529_A6BCB528 
X-CRM114-Status: GOOD (  41.00  )
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

  Hi Shahab,

On 15/06/2022 12:57, Shahab Vahedi wrote:
> Building bpftool on Debian 11 (bullseye) with kernel v5.10 fails:
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
> To be clearer about the setup, there is a clang (11) installed on this
> system. bpftool's build process enables "co-re" feature (Compile-Once,
> Run-Everywhere) if the clang compiler is new enough to support
> BTF_KIND_VAR [1]. When that happens, bpftool will bootstrap itself:
> build/bootstrap/libbpf.a. This bootstrap part is about those *.bpf.c
> programs and are only built by invoking clang [2], irrespective of the
> compiler used to build the rest of the bpftool. To sum it up, to
> reproduce the issue, all you need is having the "co-re" feature
> enabled and a kernel that does not provide all the data structures
> expected.
> 
> There are changes in bpftool v6.8.0 that assumes the existence of
> particular data structures in generated vmlinux.h that is obtained
> from the host machine. See [3] for further details. This commit adds
> a patch to revert that additional change in v6.8.0.
> 
> There's a patch series pending to be submitted upstream [4]. Hopefully,
> those will take care of the problem if they land in the next release.

  Unfortunately, bpftool has been bumped two times since then and it looks like 
those patches are still not included...

> 
> [1] Checking for the clang support
> https://github.com/libbpf/bpftool/blob/d4469819d1d639ae2354f3d2ddd10377f081a576/src/Makefile.feature#L12
> 
> [2] Using clang to bootstrap
> https://github.com/libbpf/bpftool/blob/d4469819d1d639ae2354f3d2ddd10377f081a576/src/Makefile#L175
> 
> [3] Question about the problem
> https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u
> 
> [4] Pending patch series
> https://lore.kernel.org/bpf/20220421003152.339542-1-alobakin@pm.me/

  It's not clear to me why you did a revert of the cookie feature rather than 
using those patches. I think the first two or three should be sufficient to fix 
your issue?

  For the time being, I marked this as Changes Requested. If the upstream 
patches are not sufficient, please send a mail upstream (as a reply to that 
series) explaining the problem (again), and re-send this patch to Buildroot. If 
it does fix things, please send a mail upstream to ask to move the series 
forward (explaining the issue you have), and send a patch to Buildroot that adds 
the needed patches.

  Thanks!

  Regards,
  Arnout


> 
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
> ---
> 
> Changelog:
> v1: Initial submission
> v2: Use a full fledged git patch for bpftool
> v3: Fix the snafu that resulted in malformed patch file
> v4: Reword the commit message to make it clearer
> 
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
