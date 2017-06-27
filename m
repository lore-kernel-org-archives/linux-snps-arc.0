From: fweimer@redhat.com (Florian Weimer)
Date: Tue, 27 Jun 2017 13:29:57 +0200
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3bd8b935-47c0-f190-ee6b-3d08e2f3a752@redhat.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 10:00 AM, Vineet Gupta wrote:
> diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
> new file mode 100644
> index 000000000000..c4d5d029812d
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
> @@ -0,0 +1,2 @@
> +DEFAULT                 GLIBC_2.21
> +ld=ld-linux.so.2

Is there a reason why you set the ABI baseline to GLIBC_2.21?  Why not
GLBIC_2.26?

Thanks,
Florian
